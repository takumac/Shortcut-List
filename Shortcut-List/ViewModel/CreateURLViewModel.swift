//
//  CreateURLViewModel.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/22.
//

import Foundation
import SwiftUI

class CreateURLViewModel: ObservableObject {
    @Published var appTitle: String
    @Published var appUrl: String
    
    @Published var isValidateError: Bool = false
    
    enum ValidateErrorType {
        case AppTitleError
        case AppURLError
    }
    var validateErrorType: ValidateErrorType
    
    init() {
        self.appTitle = ""
        self.appUrl = ""
        self.validateErrorType = .AppTitleError
    }
    
    /**
     作成が押された時のバリデーションメソッド
     */
    func validateCheck() {
        if self.appTitle.isEmpty {
            self.validateErrorType = .AppTitleError
            self.isValidateError = true
            return
        }
        if self.appUrl.isEmpty {
            self.validateErrorType = .AppURLError
            self.isValidateError = true
            return
        }
    }
}
