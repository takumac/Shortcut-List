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
    public static var shared = RealmManager()
    
    private init() {
        
    }
    
}
