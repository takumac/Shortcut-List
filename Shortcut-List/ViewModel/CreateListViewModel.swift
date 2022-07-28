//
//  CreateListViewModel.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation
import SwiftUI

class CreateListViewModel: ObservableObject {
    // Stored property
    @Published var listTitle: String
    @Published var listDescription: String
    @Published var applicationURLs: [ApplicationURL]
    @Published var isValidateError: Bool = false
    
    enum ValidateErrorType {
        case TitleError
        case DescriptionError
    }
    var validateErrorType: ValidateErrorType
    
    init() {
        listTitle = ""
        listDescription = ""
        applicationURLs = [ApplicationURL]()
        validateErrorType = .TitleError
    }
    
    func addButtonTap() {
        // Realmに新規リストを登録
        RealmManager.shared.addShortcutList(
            shortcutList: ShortcutList(
                            title: self.listTitle,
                            description: self.listDescription,
                            applicationURLs: self.applicationURLs,
                            order: RealmManager.shared.getShortcutListCount()
            )
        )
    }
    
    /**
     決定が押された時のバリデーションメソッド
     */
    func validateCheck() {
        if self.listTitle.isEmpty {
            self.validateErrorType = .TitleError
            self.isValidateError = true
            return
        }
        if self.listDescription.isEmpty {
            self.validateErrorType = .DescriptionError
            self.isValidateError = true
            return
        }
    }
    
}
