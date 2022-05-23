//
//  ShortcutList.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation

class ShortcutList : Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var applicationURLs: [ApplicationURL]
    
    init(title: String, description: String, applicationURLs: [ApplicationURL]) {
        self.title = title
        self.description = description
        self.applicationURLs = applicationURLs
    }
}
