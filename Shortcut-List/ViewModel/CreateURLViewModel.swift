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
    
    init() {
        self.appTitle = ""
        self.appUrl = ""
    }
}
