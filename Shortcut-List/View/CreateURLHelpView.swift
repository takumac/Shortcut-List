//
//  CreateURLHelpView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/25.
//

import SwiftUI

struct CreateURLHelpView: View {
    @Environment(\.dismiss) var envDismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("URL作成について")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            envDismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                        }
                }
            }
    }
}

//struct CreateURLHelpView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateURLHelpView()
//    }
//}
