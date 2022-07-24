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
    // FloatingButton
    static let floatingButtonBackgroundColor = Color("FloatingButton/background")
    static let floatingButtonShadowColor = Color("FloatingButton/shadow")
    // CustomButtonStyle
    static let customButtonBackgroundColor = Color("CustomButtonStyle/background")
    static let customButtonOnTapBackgroundColor = Color("CustomButtonStyle/onTapBackground")
    static let customButtonShadowColor = Color("CustomButtonStyle/shadow")
    // HelpViewColor
    static let helpViewLinkTextColor = Color("DeveloperLinkTextColor")
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

/**
 標準のnavigationviewのnavigationBarBackButtonを消してもスワイプバックができるようにするextention
 */
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
