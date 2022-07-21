//
//  NeumorphicStyle.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/21.
//
import SwiftUI

struct NeumorphicStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .foregroundColor(Color.neumorphicTextColor)
            .background(Color.neumorphicBackgroundColor)
            .cornerRadius(6)
            .shadow(color: Color.neumorphicDarkShadowColor, radius: 3, x: 2, y: 2)
            .shadow(color: Color.neumorphicLightShadowColor, radius: 3, x: -2, y: -2)
    }
}
