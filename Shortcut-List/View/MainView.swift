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
                    ForEach(viewModel.searchResult) { listItem in
                        NavigationLink(destination: ListDetailView()) {
                            MainViewRow(shortcutList: listItem)
                        }
                    }
                    .onDelete(perform: editMode.isEditing ? { indexSet in
                        // TODO: 削除ボタンが押された時の動作を実装する
                        print("削除ボタン押された")
                    } : nil)
                    .onMove(perform: { indices, newOffset in
                        // TODO: リストが移動した時の動作を実装する
                        print("移動ボタン")
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
                                    Text("完了")
                                } else {
                                    Text("編集")
                                }
                            }
                    }
                }
                
                if editMode.isEditing == false {
                    CreateListViewPresentedButton()
                }
            }
            .environment(\.editMode, $editMode)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
