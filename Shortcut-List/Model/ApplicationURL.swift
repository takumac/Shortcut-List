//
//  ApplicationURL.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation

class ApplicationURL: Identifiable {
    var id = UUID()
    var url: String
    
    init (url: String) {
        self.url = url
    }
}
