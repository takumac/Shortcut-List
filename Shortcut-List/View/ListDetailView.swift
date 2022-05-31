//
//  ListDetailView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/25.
//

import SwiftUI

struct ListDetailView: View {
    
    @Environment(\.dismiss) var envDismiss
    @Environment(\.editMode) var envEditMode
    
    @ObservedObject var viewModel = ListDetailViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            Text(viewModel.description)
                .font(.title2)
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            List {
                ForEach(viewModel.applicationURLs) { listItem in
                    ListDetailViewRow(applicationURL: listItem)
                }
                .onDelete(perform: envEditMode?.wrappedValue.isEditing == true ? { indexSet in
                    // TODO: 削除ボタンが押された時の動作を実装する
                    print("削除ボタン押された")
                } : nil)
                .onMove(perform: { indices, newOffset in
                    // TODO: リストが移動した時の動作を実装する
                    print("移動ボタン")
                })
            }
            .listStyle(.plain)
            .padding(.top)
            .navigationTitle("起動アプリを選択")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            envDismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                        }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                            withAnimation() {
                                if envEditMode?.wrappedValue.isEditing == true {
                                    envEditMode?.wrappedValue = .inactive
                                } else {
                                    envEditMode?.wrappedValue = .active
                                }
                            }
                        }) {
                            if envEditMode?.wrappedValue.isEditing == true {
                                Text("完了")
                            } else {
                                Text("編集")
                            }
                        }
                }
            }
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView()
    }
}
