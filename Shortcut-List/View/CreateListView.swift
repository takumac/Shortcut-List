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
    
    @State private var showingCompleteAlert = false
    @State private var showingCancelAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextField("タイトルを入力してください", text: $viewModel.listTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("補足説明", text: $viewModel.listDescription)
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
                                    self.showingCancelAlert.toggle()
                                }) {
                                    Text("キャンセル")
                                }
                                .alert(isPresented: $showingCancelAlert) {
                                    Alert(
                                        title: Text(""),
                                        message: Text("編集内容を破棄します。\nよろしいですか？"),
                                        primaryButton: .cancel(Text("キャンセル")) {
                                            print("キャンセル押された")
                                        },
                                        secondaryButton: .destructive(Text("破棄")) {
                                            print("破棄押された")
                                            dismiss()
                                        })
                                }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(
                                action: {
                                    self.showingCompleteAlert.toggle()
                                }) {
                                    Text("完了")
                                }
                                .alert(isPresented: $showingCompleteAlert) {
                                    Alert(
                                        title: Text(""),
                                        message: Text("新規リストとして追加します。\nよろしいですか？"),
                                        primaryButton: .cancel(Text("キャンセル")) {
                                            print("キャンセル押された")
                                        },
                                        secondaryButton: .default(Text("追加")) {
                                            // TODO: 新規リストが作成された時の動作を実装する
                                            print("追加押された")
                                            dismiss()
                                        })
                                }
                        }
                    }
                    
                }
//                
                SelectAppViewPresentedButton(applicationURLs: $viewModel.applicationURLs)
            }
        }
    }
}

//struct CreateListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateListView()
//    }
//}
