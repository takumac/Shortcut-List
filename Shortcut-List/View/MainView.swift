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
            List(viewModel.searchResult) { listItem in
                Text(listItem.title)
            }
            .listStyle(.insetGrouped)
            .searchable(text: $viewModel.searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "リスト内検索")
            .navigationBarTitle("Shortcut List", displayMode: .inline)
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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
