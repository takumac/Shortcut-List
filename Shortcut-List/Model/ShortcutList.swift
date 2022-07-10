//
//  ShortcutList.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation
import RealmSwift

class ShortcutList : Object, Identifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var listTitle: String
    @Persisted var listDescription: String
    
    // URLリストの格納用
    // アプリ内ではListではなく、Arrayで扱う
    var applicationURLs: [ApplicationURL]
    // Realm用List
    @Persisted var applicationURLList: List<ApplicationURL>

    
    override init() {
        self.listTitle = ""
        self.listDescription = ""
        self.applicationURLs = []
        self.applicationURLList = List()
        super.init()
    }
    
    init(title: String, description: String, applicationURLs: [ApplicationURL]) {
        self.listTitle = title
        self.listDescription = description
        self.applicationURLs = applicationURLs
    }
}
