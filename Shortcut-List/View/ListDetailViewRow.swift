//
//  ListDetailViewRow.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/25.
//

import SwiftUI

struct ListDetailViewRow: View {
    var applicationURL: ApplicationURL
    
    var body: some View {
        HStack {
            Text(applicationURL.appTitle)
            Spacer()
        }
    }
}

//struct ListDetailViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetailViewRow(applicationURL: listDetailViewTestData.applicationURLs[0])
//            .previewLayout(.sizeThatFits)
//    }
//}
