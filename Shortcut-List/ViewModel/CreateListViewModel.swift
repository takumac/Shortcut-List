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
    
    init() {
        listTitle = ""
        listDescription = ""
        applicationURLs = [ApplicationURL]()
    }
    
}
