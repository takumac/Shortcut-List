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
    
    @ObservedObject var viewModel: ListDetailViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Text(viewModel.listTitle)
                    .font(.title)
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                Text(viewModel.listDescription)
                    .font(.title2)
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                List {
                    ForEach(viewModel.applicationURLs, id: \.id) { listItem in
                        ListDetailViewRow(applicationURL: listItem)
                            .onTapGesture {
                                viewModel.tapApplication(applicationURL: listItem)
                            }
                    }
                    .onDelete(perform: envEditMode?.wrappedValue.isEditing == true ? { indexSet in
                        viewModel.deleteApplicationURL(offsets: indexSet)
                    } : nil)
                    .onMove(perform: { indexSet, toOffset in
                        viewModel.moveApplicationItem(indexSet: indexSet, toOffset: toOffset)
                    })
                }
                .listStyle(.plain)
                .padding(.top)
                .navigationTitle(envEditMode?.wrappedValue.isEditing == false ? "起動アプリを選択" : "編集")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(
                            action: {
                                envDismiss()
                            }) {
                                if envEditMode?.wrappedValue.isEditing == false {
                                    Image(systemName: "arrow.backward")
                                }
                            }
                            .disabled(envEditMode?.wrappedValue.isEditing == true)
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
                                    // TODO: リストの項目の編集が完了した時の動作を実装する
                                    Text("完了")
                                } else {
                                    Text("編集")
                                }
                            }
                    }
                }
            }
            
            if envEditMode?.wrappedValue.isEditing == true {
                SelectAppViewPresentedButton(applicationURLs: $viewModel.applicationURLs, onDismissProc: viewModel.addedApplication)
            }
        }
    }
}

//struct ListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetailView(viewModel: ListDetailViewModel(shortcutList: listDetailViewTestData))
//    }
//}
