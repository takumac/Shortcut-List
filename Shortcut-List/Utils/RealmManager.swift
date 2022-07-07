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
            defer { database = nil }
            try database = Realm(configuration: config)
        } catch {
            print("ERROR : \(error)")
        }
        
    }
    
}
