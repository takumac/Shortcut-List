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
    
    /**
     アプリケーションを削除する
     - Parameter offsets: 削除対象のアプリケーションの行数データ
     */
    func deleteApplicationURL(offsets: IndexSet) {
        // Realmから削除
        RealmManager.shared.deleteApplicationURL(deleteObject: applicationURLs[offsets.first!])
        // 表示している配列データから削除
        self.applicationURLs.remove(atOffsets: offsets)
    }
}
