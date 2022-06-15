//
//  SelectAppViewModel.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/26.
//

import Foundation

class SelectAppViewModel: ObservableObject {
    // Stored property
    @Published var applicationURLs: [ApplicationURL]
    
    init() {
        self.applicationURLs = ResourceManager.shared.allApplicationURL
    }
}
