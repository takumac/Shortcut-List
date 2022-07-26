//
//  AppRunErrorHelpView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/24.
//

import SwiftUI

struct AppRunErrorHelpView: View {
    @Environment(\.dismiss) var envDismiss
    
    @State var selectTab = 1
    
    var body: some View {
        VStack {
            Text("以下についてご確認ください")
                .padding()
            TabbarView(selectedTab: $selectTab)
            TabView(selection: $selectTab) {
                NotInstallAppView()
                    .tag(1)
                URLErrorView()
                    .tag(2)
            }
        }
        .navigationTitle("アプリ起動エラーについて")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(
                    action: {
                        envDismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                    }
            }
        }
    }
}

private struct TabbarView: View {
    @Binding var selectedTab : Int
        var body: some View {
            HStack {
                Spacer()
                Text("アプリ未インストール")
                .foregroundColor(selectedTab == 2 ? Color.blue : Color.gray)
                .onTapGesture {
                    self.selectedTab = 1
                }
                Spacer()
                Text("URL誤り")
                .foregroundColor(selectedTab == 1 ? Color.blue : Color.gray)
                .onTapGesture {
                    self.selectedTab = 2
                }
                Spacer()
            }
        }
}

//struct URLErrorHelpView_Previews: PreviewProvider {
//    static var previews: some View {
//        URLErrorHelpView()
//    }
//}
