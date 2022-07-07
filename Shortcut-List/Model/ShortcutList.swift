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
    var applicationURLs: [ApplicationURL]
    
    override init() {
        applicationURLs = []
        super.init()
    }
    
    init(title: String, description: String, applicationURLs: [ApplicationURL]) {
        self.listTitle = title
        self.listDescription = description
        self.applicationURLs = applicationURLs
    }
}
