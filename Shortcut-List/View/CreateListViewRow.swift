//
//  CreateListViewRow.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import SwiftUI

struct CreateListViewRow: View {
    var applicationURL: ApplicationURL
    
    var body: some View {
        HStack {
            Text(applicationURL.url)
            Spacer()
        }
    }
}

struct CreateListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        CreateListViewRow(applicationURL: createViewTestData[0])
            .previewLayout(.sizeThatFits)
    }
}
