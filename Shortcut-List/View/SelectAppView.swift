//
//  SelectAppViwe.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/26.
//

import SwiftUI

struct SelectAppView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var applicationURLs: [ApplicationURL]
    
    @ObservedObject var viewModel = SelectAppViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.selectableApplicationURLs) { listItem in
                    HStack {
                        ListDetailViewRow(applicationURL: listItem)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        applicationURLs.append(ApplicationURL(
                                                appTitle: listItem.appTitle,
                                                appUrl: listItem.appUrl,
                                                order: self.applicationURLs.count
                                                )
                                            )
                        dismiss()
                    }
                }
                .listStyle(.plain)
                .padding(.top)
                .navigationTitle("アプリを選択")
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
}

//struct SelectAppViwe_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectAppView()
//    }
//}
