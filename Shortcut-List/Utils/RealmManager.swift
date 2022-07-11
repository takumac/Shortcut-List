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
        config = Realm.Configuration()
        do {
            // Realm設定
            try database = Realm(configuration: config)
            print("Realm File : \(Realm.Configuration.defaultConfiguration.fileURL!)")
        } catch {
            database = nil
            print("ERROR : \(error)")
        }
        
    }
    
    /**
     Realmに保存されているショートカットリストを全件取得する
     - Returns: 取得できたショートカットリスト
     */
    func getShotrcutList() -> [ShortcutList] {
        if database != nil {
            // Realmが参照可能なら取得できたリストを使用
            let realmResults = database!.objects(ShortcutList.self)
            var returnShortcutList:[ShortcutList] = [ShortcutList]()
            realmResults.forEach {
                let shortcutList = ShortcutList()
                shortcutList.id = $0.id
                shortcutList.listTitle = $0.listTitle
                shortcutList.listDescription = $0.listDescription
                shortcutList.applicationURLList = $0.applicationURLList
                shortcutList.applicationURLs.append(contentsOf: Array($0.applicationURLList))
                
                returnShortcutList.append(shortcutList)
            }
            
            return returnShortcutList
        } else {
            // Realmが参照不可なら空のリストを使用
            print("Realm Error")
            return [ShortcutList]()
        }
    }
    
    
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
            if let targetApplicationURL = database?.objects(ApplicationURL.self).filter("id == \"\($0.id)\"") {
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
    
}
