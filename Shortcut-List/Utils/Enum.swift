//
//  Enum.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/27.
//

import Foundation
import SwiftUI

enum FloatingButtonTransition: View, Hashable, Identifiable {
    case SELECT_APP
    
    var body: some View {
        switch self {
            case .SELECT_APP: return AnyView(SelectAppView())
        }
    }
}
