//
//  MainViewModel.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var shortcutLists: [ShortcutList]
    
    @Published var searchText: String = ""
    var searchResult: [ShortcutList] {
        if(searchText.isEmpty) {
            return shortcutLists
        } else {
            return shortcutLists.filter { $0.title.contains(searchText) }
        }
    }
    
    init() {
        shortcutLists = testData
    }
}
