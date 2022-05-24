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
                    MainViewRow(shortcutList: listItem)
                }
                .listStyle(.plain)
                .searchable(text: $viewModel.searchText,
                            placement: .navigationBarDrawer(displayMode: .always),
                            prompt: "リスト内検索")
                .navigationTitle("Shortcut List")
                .navigationBarItems(
                    leading: Button(
                        action: {
                            print("左のボタン押した")
                            
                        }) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.blue)
                        },
                    trailing: Button(
                        action: {
                            print("右のボタン押した")
                            
                        }) {
                        Text("編集")
                    })
                
                FloatingButton()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
