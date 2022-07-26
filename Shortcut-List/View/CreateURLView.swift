//
//  CreateURLView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/22.
//

import SwiftUI

struct CreateURLView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var applicationURLs: [ApplicationURL]
    
    @ObservedObject var viewModel = CreateURLViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("アプリタイトル")
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                TextField("アプリタイトル", text: $viewModel.appTitle)
                    .padding(.leading)
                    .padding(.trailing)
                    .textFieldStyle(SecondaryNeumorphicStyle())
                Text("アプリURL")
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                TextField("アプリURL", text: $viewModel.appUrl)
                    .padding(.leading)
                    .padding(.trailing)
                    .textFieldStyle(SecondaryNeumorphicStyle())
                Spacer().frame(height: 150)
                Button("作成") {
                    applicationURLs.append(ApplicationURL(
                                            appTitle: viewModel.appTitle,
                                            appUrl: viewModel.appUrl,
                                            order: self.applicationURLs.count
                                            )
                                        )
                    dismiss()
                }
                .padding()
                .buttonStyle(CustomButtonStyle())
            }
            .navigationTitle("URLを作成")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            dismiss()
                        }) {
                            Text("キャンセル")
                        }
                }
            }
        }
    }
}

//struct CreateURLView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateURLView()
//    }
//}
