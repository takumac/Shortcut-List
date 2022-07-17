//
//  MainView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    /**
     NavigationViewを用いると、NavigationViewの外側と内側で別画面扱いになり、正しくeditModeの値が取得できないため、外側で定義した editModeをNavigationViewの内側の環境変数とする
     **/
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.searchResult, id: \.id) { listItem in
                        NavigationLink(destination: ListDetailView(viewModel: ListDetailViewModel(shortcutList: listItem))) {
                            MainViewRow(shortcutList: listItem)
                        }
                    }
                    .onDelete(perform: editMode.isEditing ? { indexSet in
                        viewModel.deleteShotrcutListItem(offsets: indexSet)
                    } : nil)
                    .onMove(perform: { indexSet, toOffset in
                        viewModel.moveShortcutListItem(indexSet: indexSet, toOffset: toOffset)
                    })
                }
                .listStyle(.plain)
                .searchable(text: $viewModel.searchText,
                            placement: .navigationBarDrawer(displayMode: .always),
                            prompt: "リスト内検索")
                .navigationTitle("Shortcut List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(
                            action: {
                                withAnimation() {
                                    // TODO: 歯車マークを押した時の動作を実装する
                                    print("歯車ボタンを押した")
                                }
                                
                            }) {
                                if editMode.isEditing == false {
                                    Image(systemName: "gearshape.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .disabled(editMode.isEditing)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                withAnimation() {
                                    if editMode.isEditing == true {
                                        $editMode.wrappedValue = .inactive
                                    } else {
                                        $editMode.wrappedValue = .active
                                    }
                                }
                            }) {
                                if editMode.isEditing == true {
                                    // TODO: 編集が完了した時の動作を実装する
                                    Text("完了")
                                } else {
                                    Text("編集")
                                }
                            }
                    }
                }
                
                if editMode.isEditing == false {
                    CreateListViewPresentedButton(onDismissProc: {
                        viewModel.updateShortcutLists()
                    })
                }
            }
            .environment(\.editMode, $editMode)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
