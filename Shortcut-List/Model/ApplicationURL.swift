//
//  ApplicationURL.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation

class ApplicationURL: Identifiable {
    var id = UUID()
    var appTitle: String
    var appUrl: String
    
    init (appTitle: String, appUrl: String) {
        self.appTitle = appTitle
        self.appUrl = appUrl
    }
}
