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
                if envEditMode?.wrappedValue.isEditing == true {
                    TextField("タイトル", text: $viewModel.listTitle)
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(PrimaryNeumorphicStyle())
                } else {
                    Text(viewModel.listTitle)
                        .padding()
                        .font(.largeTitle)
                }
                if envEditMode?.wrappedValue.isEditing == true {
                    TextField("説明", text: $viewModel.listDescription)
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(PrimaryNeumorphicStyle())
                } else {
                    Text(viewModel.listDescription)
                        .padding()
                        .font(.title)
                }
                
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
                                viewModel.updateShortcutList()
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
            
            if envEditMode?.wrappedValue.isEditing == true {
                SelectAppViewPresentedButton(applicationURLs: $viewModel.applicationURLs, onDismissProc: viewModel.updateShortcutList)
            }
        }
    }
}

//struct ListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetailView(viewModel: ListDetailViewModel(shortcutList: listDetailViewTestData))
//    }
//}
