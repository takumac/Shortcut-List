//
//  Wrapper.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/26.
//

import Foundation
import SwiftUI

class BoolWrapper: ObservableObject {
    @Published var value: Bool
    init(value: Bool) { self.value = value}
}

class IntWrapper {
    var value: Bool
    init(value: Bool) { self.value = value }
}
