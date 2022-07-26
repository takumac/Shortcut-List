//
//  AppSettingView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/24.
//

import SwiftUI

struct HelpView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section("Help") {
                    NavigationLink(destination: AppRunErrorHelpView()) {
                        Text("アプリ起動エラーについて")
                    }
                    NavigationLink(destination: CreateURLHelpView()) {
                        Text("URL作成について")
                    }
                    
                }
                .textCase(.none)
                Section("Contact") {
                    HStack {
                        Link(destination: URL(string: "https://forms.gle/2SzZ87Tsqvr3jX7L6")!) {
                            Text("お問い合わせ")
                                .foregroundColor(Color.helpViewLinkTextColor)
                        }
                    }
                }
                .textCase(.none)
                Section("Info") {
                    HStack {
                        Text("Developer")
                        Spacer()
                        Link(destination: URL(string: "https://twitter.com/sake_enenen")!) {
                            Text("Takumi Sakai")
                                .foregroundColor(Color.helpViewLinkTextColor)
                        }
                    }
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                    }
                }
                .textCase(.none)
            }
            .navigationTitle("ヘルプ")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            isActive.toggle()
                        }) {
                            Image(systemName: "xmark")
                        }
                }
            }
        }
    }
}

//struct AppSettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppSettingView()
//    }
//}
