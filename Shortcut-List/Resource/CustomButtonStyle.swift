//
//  CustomButtonStyle.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/23.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(Color.white)
            // タップ中かどうかで背景色を変更する
            .background(configuration.isPressed ? Color.customButtonOnTapBackgroundColor : Color.customButtonBackgroundColor)
            .cornerRadius(4)
    }
}
