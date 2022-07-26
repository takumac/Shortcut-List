//
//  CreateURLHelpView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/25.
//

import SwiftUI

struct CreateURLHelpView: View {
    @Environment(\.dismiss) var envDismiss
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("本アプリではURLを作成することでデフォルトで用意されているアプリ以外のアプリを起動することが可能です。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                
                HStack {
                    Text("以下の方法を参考にURL作成を行ってください。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                
                Text("【URLの作成手順】")
                    .padding(.top)
                    .padding(.bottom)
                HStack {
                    Text("1. 起動したいアプリのURLスキームを調べる。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                HStack {
                    Text("2. Safariを起動し、URL欄に「調べたURLスキーム://」と入力する。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                HStack {
                    Text("3. 該当のアプリが起動することを確認する。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                HStack {
                    Text("4. 本アプリの新規登録画面より右下の追加ボタンをタップ。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                HStack {
                    Text("5. 「URLを作成」をタップ。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                HStack {
                    Text("6. 「アプリURL」欄に調べたURLスキームを入力し「作成」ボタンをタップ。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                
                HStack {
                    Text("上記の手順を行っていただくと、ショートカットリストに作成したURLが登録されデフォルトのアプリから選択した時と同様に、本アプリからの起動が可能になります。")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            }
        }
        .navigationTitle("URL作成について")
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

//struct CreateURLHelpView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateURLHelpView()
//    }
//}
