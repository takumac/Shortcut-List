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
    @Published var shortcutLists: [ShortcutList]
    @Published var searchText: String
    // Computed property
    var searchResult: [ShortcutList] {
        if(searchText.isEmpty) {
            return shortcutLists
        } else {
            return shortcutLists.filter { $0.listTitle.contains(searchText) }
        }
    }
    
    init() {
        shortcutLists = RealmManager.shared.getShortcutList()
        searchText = ""
    }
    
    /**
     最新のRealmの状態でショートカットリストを更新する
     */
    func updateShortcutLists() {
        shortcutLists = RealmManager.shared.getShortcutList()
    }
    
    /**
     ショートカットリストを削除する
     - Parameter offsets: 削除対象のリストの行数データ
     */
    func deleteShotrcutListItem(offsets: IndexSet) {
        // Realmから削除
        RealmManager.shared.deleteShortcutList(deleteObject: self.shortcutLists[offsets.first!])
        // 表示している配列データから削除
        self.shortcutLists.remove(atOffsets: offsets)
    }
    
    /**
     ショートカットリストを並び替える
     */
    func moveShortcutListItem(indexSet: IndexSet, toOffset: Int) {
        // Realm内のデータを並び替える
        guard let index = indexSet.first else {
            print("行数取得エラー")
            return
        }
        
        // 並び替える行のidを取得
        let moveItem = self.shortcutLists[index]
        
        if (index < toOffset) { // 対象の行を下に移動させた場合
            for i in (index + 1)...(toOffset - 1) {
                RealmManager.shared.updateShortcutListOrder(shortcutList: shortcutLists[i], order: shortcutLists[i].order - 1)
                self.shortcutLists[i].order = self.shortcutLists[i].order - 1
            }
            RealmManager.shared.updateShortcutListOrder(shortcutList: moveItem, order: toOffset - 1)
            self.shortcutLists[index].order = toOffset - 1
        } else if toOffset < index { // 対象の行を上に移動させた場合
            for i in (toOffset...(index - 1)).reversed() {
                RealmManager.shared.updateShortcutListOrder(shortcutList: shortcutLists[i], order: shortcutLists[i].order + 1)
                self.shortcutLists[i].order = self.shortcutLists[i].order + 1
            }
            RealmManager.shared.updateShortcutListOrder(shortcutList: moveItem, order: toOffset)
            self.shortcutLists[index].order = toOffset
        } else { // 同じ行に移動させた場合
            return
        }
        
        // 表示しているデータを並び替える
        self.shortcutLists.move(fromOffsets: indexSet, toOffset: toOffset)
    }
    
}
