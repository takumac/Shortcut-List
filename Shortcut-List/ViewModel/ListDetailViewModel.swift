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
    
    init() {
        self.title = "テスト用タイトル"
        self.description = "テスト用補足説明"
        self.applicationURLs = listDetailViewTestData
    }
}
