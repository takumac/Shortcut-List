//
//  MainViewRow.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import SwiftUI

struct MainViewRow: View {
    var shortcutList: ShortcutList
    
    var body: some View {
        VStack {
            HStack {
                Text(shortcutList.title)
                Spacer()
            }
            HStack {
                Text(shortcutList.description)
                Spacer()
            }
        }
    }
}

struct MainViewRow_Previews: PreviewProvider {
    static var previews: some View {
        MainViewRow(shortcutList: testData[0])
            .previewLayout(.sizeThatFits)
    }
}
