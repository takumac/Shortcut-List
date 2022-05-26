//
//  MainView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.searchResult) { listItem in
                    NavigationLink(destination: ListDetailView()) {
                        MainViewRow(shortcutList: listItem)
                    }
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
                                print("左のボタン押した")
                                
                            }) {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.blue)
                            }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                print("右のボタン押した")
                                
                            }) {
                                Text("編集")
                            }
                    }
                }
                
                CreateListViewPresentedButton()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
