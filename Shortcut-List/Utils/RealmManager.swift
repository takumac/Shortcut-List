//
//  RealmManager.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/06/30.
//

import Foundation
import RealmSwift

/**
 Realmに関する処理を行うクラス
 シングルトン設計
 */
final public class RealmManager {
    public static let shared = RealmManager()
    var config: Realm.Configuration
    var database: Realm?
    
    private init() {
        // マイグレーション処理
        // DBの定義を変更する場合はnextSchemaVersionの値を1上げる
        let nextSchemaVersion = UInt64(1)
        config = Realm.Configuration(
            schemaVersion: nextSchemaVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < nextSchemaVersion {
                    // マイグレーション時の処理を記載
                }
            })
        config.deleteRealmIfMigrationNeeded = true
        
        do {
            // Realm設定
            try database = Realm(configuration: config)
            print("Realm File : \(Realm.Configuration.defaultConfiguration.fileURL!)")
        } catch {
            database = nil
            print("ERROR : \(error)")
        }
        
    }
    
    
    // Create
    /**
     Realmにショートカットリストを追加する
     - Parameter shortcutList: 追加するショートカットリスト
     */
    func addShortcutList(shortcutList: ShortcutList) {
        // モデルのArrayをRealm用のListにコピー
        shortcutList.applicationURLList.append(objectsIn: shortcutList.applicationURLs)
        // Realmに追加
        do {
            try database?.write {
                database?.add(shortcutList)
            }
        } catch {
            print("ERROR : \(error)")
        }
    }
    
    
    // Read
    /**
     Realmに保存されているショートカットリストを全件取得する
     - Returns: 取得できたショートカットリスト
     */
    func getShortcutList() -> [ShortcutList] {
        if database != nil {
            // Realmが参照可能なら取得できたリストを使用
            let realmResults = database!.objects(ShortcutList.self).sorted(byKeyPath: "order", ascending: true)
            var returnShortcutList:[ShortcutList] = [ShortcutList]()
            realmResults.forEach {
                let shortcutList = ShortcutList()
                shortcutList.id = $0.id
                shortcutList.listTitle = $0.listTitle
                shortcutList.listDescription = $0.listDescription
                shortcutList.order = $0.order
                shortcutList.applicationURLList = $0.applicationURLList
                shortcutList.applicationURLs.append(contentsOf: Array($0.applicationURLList))
                shortcutList.applicationURLs.sort(by: {$0.order < $1.order})
                
                returnShortcutList.append(shortcutList)
            }
            
            return returnShortcutList
        } else {
            // Realmが参照不可なら空のリストを使用
            print("Realm Error : RealmManager#getShortcutList")
            return [ShortcutList]()
        }
    }
    
    /**
     Realmに保存されているショートカットリストの件数を取得する
     - Returns: 保存されている件数
     */
    func getShortcutListCount() -> Int {
        if database != nil {
            // Realmが参照可能なら取得できたリストを使用
            let realmResults = database!.objects(ShortcutList.self)
            return realmResults.count
        } else {
            print("Realm Error : RealmManager#getShortcutListCount")
            return 0
        }
    }
    
    
    // Update
    /**
     Realmに保存されているショートカットリストを更新する
     - Parameter updateObject: 更新対象のショートカットリスト
     */
    func updateShortcutList(updateObject: ShortcutList) {
        do {
            try database?.write {
                database?.add(ShortcutList(
                                value: ["id" : updateObject.id,
                                        "listTitle" : updateObject.listTitle,
                                        "listDescription" : updateObject.listDescription,
                                        "applicationURLList" : updateObject.applicationURLList,
                                        "order" : updateObject.order]
                            ), update: .modified)
            }
        } catch {
            print("Realm Error : \(error)")
        }
    }
    
    /**
     Realmに保存されているアプリケーションを更新する
     - Parameter updateObject: 更新対象のアプリケーション
     */
    func updateApplication(updateObject: ApplicationURL) {
        do {
            try database?.write {
                database?.add(ApplicationURL(
                            value: ["id" : updateObject.id,
                                    "appTitle" : updateObject.appTitle,
                                    "appUrl" : updateObject.appUrl,
                                    "order" : updateObject.order]
                            ), update: .modified)
            }
        } catch {
            print("Realm Error : \(error)")
        }
    }
    
    
    // Delete
    /**
     Realmからショートカットリストを削除する
     - Parameter deleteObject: 削除対象のショートカットリスト
     */
    func deleteShortcutList(deleteObject: ShortcutList) {
        // パラメタの情報から削除対象のショートカットリストデータを取得
        if let targetShortcutList = database?.objects(ShortcutList.self).filter("id == \"\(deleteObject.id)\"") {
            // Realmから削除
            do {
                try database?.write {
                    // ShortcutListを削除
                    database?.delete(targetShortcutList)
                }
            } catch {
                print("ERROR : \(error)")
            }
        }
        // 削除対象のショートカットリストとリレーションを持つアプリケーションURLデータを取得
        deleteObject.applicationURLs.forEach {
            deleteApplicationURL(deleteObject: $0)
        }
        
    }
    
    /**
     Realmからアプリケーションを削除する
     - Parameter deleteObject: 削除対象のアプリケーション
     */
    func deleteApplicationURL(deleteObject: ApplicationURL) {
        if let targetApplicationURL = database?.objects(ApplicationURL.self).filter("id == \"\(deleteObject.id)\"") {
            // Realmから削除
            do {
                try database?.write {
                    // ApplicationURLを削除
                    database?.delete(targetApplicationURL)
                }
            } catch {
                print("ERROR : \(error)")
            }
        }
    }
    
}
