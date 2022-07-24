//
//  AppRunErrorHelpView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/24.
//

import SwiftUI

struct AppRunErrorHelpView: View {
    @Environment(\.dismiss) var envDismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("アプリ起動エラーについて")
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

//struct URLErrorHelpView_Previews: PreviewProvider {
//    static var previews: some View {
//        URLErrorHelpView()
//    }
//}
