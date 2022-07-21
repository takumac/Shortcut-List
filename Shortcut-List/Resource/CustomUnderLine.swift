//
//  CustomUnderLine.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/21.
//

import SwiftUI

struct CustomUnderLine: View {

    enum Orientation {
        case horizontal
        case vertical
    }
    
    let orientation: Orientation
    let thickness: CGFloat
    let color: Color

    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(
                width: orientation == .horizontal ? .none : thickness,
                height: orientation == .vertical ? .none : thickness)
    }
}
