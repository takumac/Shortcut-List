//
//  ListDetailView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/25.
//

import SwiftUI

struct ListDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
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
            List(viewModel.applicationURLs) { listItem in
                ListDetailViewRow(applicationURL: listItem)
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
                            dismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                        }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("右のボタン押した")
                    }) {
                        Text("編集")
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
