//
//  SelectAppViewRow.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/26.
//

import SwiftUI

struct SelectAppViewRow: View {
    var applicationURL: ApplicationURL
    
    var body: some View {
        HStack {
            Text(applicationURL.appTitle)
            Spacer()
        }
    }
}

struct SelectAppViewRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectAppViewRow(applicationURL: selectAppViewTestData[0])
            .previewLayout(.sizeThatFits)
    }
}
