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
    @Published var title: String
    @Published var description: String
    @Published var applicationURLs: [ApplicationURL]
    
    init(shortcutList: ShortcutList) {
        self.title = shortcutList.title
        self.description = shortcutList.description
        self.applicationURLs = shortcutList.applicationURLs
    }
}
