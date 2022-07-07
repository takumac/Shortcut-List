//
//  ListDetailViewModel.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/25.
//

import Foundation
import SwiftUI

class ListDetailViewModel: ObservableObject {
    // Stored property
    @Published var listTitle: String
    @Published var listDescription: String
    @Published var applicationURLs: [ApplicationURL]
    
    init(shortcutList: ShortcutList) {
        self.listTitle = shortcutList.listTitle
        self.listDescription = shortcutList.listDescription
        self.applicationURLs = shortcutList.applicationURLs
    }
    
    func tapApplication(applicationURL: ApplicationURL) {
        applicationURL.openApp()
    }
}
