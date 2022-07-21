//
//  NeumorphicStyle.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/21.
//
import SwiftUI

struct PrimaryNeumorphicStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .foregroundColor(Color.primaryNeumorphicTextColor)
            .background(Color.primaryNeumorphicBackgroundColor)
            .cornerRadius(6)
            .shadow(color: Color.primaryNeumorphicDarkShadowColor, radius: 3, x: 2, y: 2)
            .shadow(color: Color.primaryNeumorphicLightShadowColor, radius: 3, x: -2, y: -2)
    }
}

struct SecondaryNeumorphicStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .foregroundColor(Color.secondaryNeumorphicTextColor)
            .background(Color.secondaryNeumorphicBackgroundColor)
            .cornerRadius(6)
            .shadow(color: Color.secondaryNeumorphicDarkShadowColor, radius: 3, x: 2, y: 2)
            .shadow(color: Color.secondaryNneumorphicLightShadowColor, radius: 3, x: -2, y: -2)
    }
}
