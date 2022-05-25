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
    @Published var title: String
    @Published var description: String
    @Published var applicationURLs: [ApplicationURL]
    
    init() {
        title = ""
        description = ""
        applicationURLs = createViewTestData
    }
    
}