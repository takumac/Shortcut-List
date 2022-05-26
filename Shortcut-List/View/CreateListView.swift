//
//  CreateListView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import SwiftUI

struct CreateListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = CreateListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextField("タイトルを入力してください", text: $viewModel.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("補足説明", text: $viewModel.description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                    List(viewModel.applicationURLs) { listItem in
                        CreateListViewRow(applicationURL: listItem)
                    }
                    .listStyle(.plain)
                    .padding(.top)
                    .navigationTitle("新規登録")
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
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(
                                action: {
                                    print("右のボタンが押した")
                                }) {
                                    Text("完了")
                                }
                        }
                    }
                    
                }
                
                SelectAppViewPresentedButton()
            }
        }
    }
}

struct CreateListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListView()
    }
}
