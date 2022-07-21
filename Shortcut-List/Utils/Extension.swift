//
//  Extension.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/27.
//

import Foundation
import SwiftUI

extension Color {
    // CustomUnderLine
    static let customUnderLineColor = Color("CustomUnderLine/underLineColor")
    // NeumorphicStyle
    static let neumorphicTextColor = Color("NeumorphicStyle/neumorphicTextColor")
    static let neumorphicBackgroundColor = Color("NeumorphicStyle/background")
    static let neumorphicDarkShadowColor = Color("NeumorphicStyle/darkShadow")
    static let neumorphicLightShadowColor = Color("NeumorphicStyle/lightShadow")
}

extension Identifiable where Self: Hashable {
    typealias ID = Self
    var id: Self { self }
}

extension UITraitCollection {
    public static var isDarkMode: Bool {
        if #available(iOS 13, *), current.userInterfaceStyle == .dark {
            return true
        }
        return false
    }
}

