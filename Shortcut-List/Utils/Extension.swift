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
    static let primaryNeumorphicTextColor = Color("NeumorphicStyle/Primary/neumorphicTextColor")
    static let primaryNeumorphicBackgroundColor = Color("NeumorphicStyle/Primary/background")
    static let primaryNeumorphicDarkShadowColor = Color("NeumorphicStyle/Primary/darkShadow")
    static let primaryNeumorphicLightShadowColor = Color("NeumorphicStyle/Primary/lightShadow")
    static let secondaryNeumorphicTextColor = Color("NeumorphicStyle/Secondary/neumorphicTextColor")
    static let secondaryNeumorphicBackgroundColor = Color("NeumorphicStyle/Secondary/background")
    static let secondaryNeumorphicDarkShadowColor = Color("NeumorphicStyle/Secondary/darkShadow")
    static let secondaryNneumorphicLightShadowColor = Color("NeumorphicStyle/Secondary/lightShadow")
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

