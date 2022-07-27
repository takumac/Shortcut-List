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
    @Published var isShowingAppOpenErrorAlert: BoolWrapper = BoolWrapper(value: false)
    @Published var isValidateError: BoolWrapper = BoolWrapper(value: false)
    
    enum ValidateErrorType {
        case TitleError
        case DescriptionError
    }
    var validateErrorType: ValidateErrorType
    
    // アプリケーションが「追加」された際にショートカットリスト自体を更新するために保持している変数
    var id: UUID
    var order: Int
    
    init(shortcutList: ShortcutList) {
        self.listTitle = shortcutList.listTitle
        self.listDescription = shortcutList.listDescription
        self.applicationURLs = shortcutList.applicationURLs
        
        self.id = shortcutList.id
        self.order = shortcutList.order
        self.validateErrorType = .TitleError
    }
    
    func tapApplication(applicationURL: ApplicationURL) {
        applicationURL.openApp(isErrorOpen: self.isShowingAppOpenErrorAlert)
    }
    
    func tapAppOpenErrorAlert() {
        self.isShowingAppOpenErrorAlert = BoolWrapper(value: !self.isShowingAppOpenErrorAlert.value)
    }
    
    func updateShortcutList() {
        RealmManager.shared.updateShortcutList(updateObject: ShortcutList(
                                                                id: self.id,
                                                                title: self.listTitle,
                                                                description: self.listDescription,
                                                                applicationURLs: self.applicationURLs,
                                                                order: self.order
                                                                )
                                                            )
    }
    
    /**
     アプリケーションを削除する
     - Parameter offsets: 削除対象のアプリケーションの行数データ
     */
    func deleteApplicationURL(offsets: IndexSet) {
        guard let index = offsets.first else {
            print("行数取得エラー")
            return
        }
        
        // 削除する行のデータを取得
        let deleteItem = self.applicationURLs[index]
        // 削除する行の行番号より大きい行番号を全て-1する
        for i in (deleteItem.order + 1)..<self.applicationURLs.count {
            RealmManager.shared.updateApplication(updateObject: ApplicationURL(
                                                                    id: self.applicationURLs[i].id,
                                                                    appTitle: self.applicationURLs[i].appTitle,
                                                                    appUrl: self.applicationURLs[i].appUrl,
                                                                    order: self.applicationURLs[i].order - 1
                                                                )
                                                            )
        }
        // Realmから削除
        RealmManager.shared.deleteApplicationURL(deleteObject: applicationURLs[offsets.first!])
        // 表示している配列データから削除
        self.applicationURLs.remove(atOffsets: offsets)
    }
    
    /**
     アプリケーションを並び替える
     - Parameters:
     - indexSet: 移動前の行のIndexSet
     - toOffset: 移動後の行の行数
     */
    func moveApplicationItem(indexSet: IndexSet, toOffset: Int) {
        guard let index = indexSet.first else {
            print("行数取得エラー")
            return
        }
        
        if index < toOffset { // 対象の行を下に移動させた場合
            for i in (index + 1)...(toOffset - 1) {
                RealmManager.shared.updateApplication(updateObject: ApplicationURL(
                                                                        id: self.applicationURLs[i].id,
                                                                        appTitle: self.applicationURLs[i].appTitle,
                                                                        appUrl: self.applicationURLs[i].appUrl,
                                                                        order: self.applicationURLs[i].order - 1
                                                                    )
                                                                )
            }
            RealmManager.shared.updateApplication(updateObject: ApplicationURL(
                                                                    id: self.applicationURLs[index].id,
                                                                    appTitle: self.applicationURLs[index].appTitle,
                                                                    appUrl: self.applicationURLs[index].appUrl,
                                                                    order: toOffset - 1
                                                                )
                                                            )
        } else if toOffset < index { // 対象の行を上に移動させた場合
            for i in (toOffset...(index - 1)).reversed() {
                RealmManager.shared.updateApplication(updateObject: ApplicationURL(
                                                                        id: self.applicationURLs[i].id,
                                                                        appTitle: self.applicationURLs[i].appTitle,
                                                                        appUrl: self.applicationURLs[i].appUrl,
                                                                        order: self.applicationURLs[i].order + 1
                                                                    )
                                                                )
            }
            RealmManager.shared.updateApplication(updateObject: ApplicationURL(
                                                                    id: self.applicationURLs[index].id,
                                                                    appTitle: self.applicationURLs[index].appTitle,
                                                                    appUrl: self.applicationURLs[index].appUrl,
                                                                    order: toOffset
                                                                )
                                                            )
        } else { // 同じ行に移動させた場合
            return
        }
        
        self.applicationURLs.move(fromOffsets: indexSet, toOffset: toOffset)
    }
    
    
    /**
     編集が行われた時のバリデーションメソッド
     */
    func validateCheck() {
        if self.listTitle.isEmpty {
            self.validateErrorType = .TitleError
            self.isValidateError.value = true
        }
        if self.listDescription.isEmpty {
            self.validateErrorType = .DescriptionError
            self.isValidateError.value = true
        }
    }
}
