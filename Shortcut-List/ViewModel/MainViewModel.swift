//
//  MainViewModel.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    // Stored property
    // Computed property
    @Published var shortcutLists: [ShortcutList]
    @Published var searchText: String
    var searchResult: [ShortcutList] {
        if(searchText.isEmpty) {
            return shortcutLists
        } else {
            return shortcutLists.filter { $0.listTitle.contains(searchText) }
        }
    }
    
    init() {
        shortcutLists = RealmManager.shared.getShotrcutList()
        searchText = ""
    }
    
    /**
     最新のRealmの状態でショートカットリストを更新する
     */
    func getShortcutLists() {
        shortcutLists = RealmManager.shared.getShotrcutList()
    }
    
    
    
    
    // TODO:  テスト用に直接アプリのURLを指定して開いてみる
    var tmpApplicationURL = ApplicationURL(appTitle: "photos", appUrl: "photos-redirect://")
    func runApp() {
        tmpApplicationURL.openApp()
    }
    var tmpApplicationURL2 = ApplicationURL(appTitle: "calshow", appUrl: "calshow://")
    func runApp2() {
        tmpApplicationURL2.openApp()
    }
    
}
