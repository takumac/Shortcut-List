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
                Text(shortcutList.listTitle)
                    .font(.title)
                    .foregroundColor(.blue)
                Spacer()
            }
            HStack {
                Text(shortcutList.listDescription)
                    .foregroundColor(.gray)
                Spacer()
            }
        }
    }
}

//struct MainViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MainViewRow(shortcutList: mainViewTestData[0])
//            .previewLayout(.sizeThatFits)
//    }
//}
