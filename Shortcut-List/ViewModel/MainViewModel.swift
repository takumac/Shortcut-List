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
        guard let index = offsets.first else {
            print("行数取得エラー")
            return
        }
        
        // 削除する行のデータを取得
        let deleteItem = self.shortcutLists[index]
        
        // 削除する行の行番号より大きい行番号を全て-1する
        for i in (deleteItem.order + 1)..<self.shortcutLists.count {
            self.shortcutLists[i].order -= 1
            RealmManager.shared.updateShortcutList(updateObject: self.shortcutLists[i])
        }
        
        // Realmから削除
        RealmManager.shared.deleteShortcutList(deleteObject: self.shortcutLists[offsets.first!])
        // 表示している配列データから削除
        self.shortcutLists.remove(atOffsets: offsets)
    }
    
    /**
     ショートカットリストを並び替える
     - Parameters:
     - indexSet: 移動元の行のIndexSet
     - toOffset: 移動後の行の行数
     */
    func moveShortcutListItem(indexSet: IndexSet, toOffset: Int) {
        guard let index = indexSet.first else {
            print("行数取得エラー")
            return
        }
        
        if index < toOffset { // 対象の行を下に移動させた場合
            for i in (index + 1)...(toOffset - 1) {
                self.shortcutLists[i].order = self.shortcutLists[i].order - 1
                RealmManager.shared.updateShortcutList(updateObject: self.shortcutLists[i])
            }
            self.shortcutLists[index].order = toOffset - 1
            RealmManager.shared.updateShortcutList(updateObject: self.shortcutLists[index])
        } else if toOffset < index { // 対象の行を上に移動させた場合
            for i in (toOffset...(index - 1)).reversed() {
                self.shortcutLists[i].order = self.shortcutLists[i].order + 1
                RealmManager.shared.updateShortcutList(updateObject: self.shortcutLists[i])
            }
            self.shortcutLists[index].order = toOffset
            RealmManager.shared.updateShortcutList(updateObject: self.shortcutLists[index])
        } else { // 同じ行に移動させた場合
            return
        }
        
        // 表示しているデータを並び替える
        self.shortcutLists.move(fromOffsets: indexSet, toOffset: toOffset)
    }
    
}
