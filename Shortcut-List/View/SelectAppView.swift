//
//  SelectAppViwe.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/26.
//

import SwiftUI

struct SelectAppView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = SelectAppViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.applicationURLs) { listItem in
                    ListDetailViewRow(applicationURL: listItem)
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

struct SelectAppViwe_Previews: PreviewProvider {
    static var previews: some View {
        SelectAppView()
    }
}
