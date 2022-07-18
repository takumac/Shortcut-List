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
    @Persisted var order: Int
    
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
    
    /**
     新規のショートカットリストとして初期化（id未指定）
     */
    init(title: String, description: String, applicationURLs: [ApplicationURL], order: Int) {
        self.listTitle = title
        self.listDescription = description
        self.applicationURLs = applicationURLs
        self.order = order
    }
    
    /**
     既存のショートカットリストの内容を引き継いで初期化（id指定）
     */
    init(id: UUID, title: String, description: String, applicationURLs: [ApplicationURL], order: Int) {
        self.id = id
        self.listTitle = title
        self.listDescription = description
        self.applicationURLs = applicationURLs
        self.order = order
        
        super.init()
        self.applicationURLList.append(objectsIn: applicationURLs)
    }
}
