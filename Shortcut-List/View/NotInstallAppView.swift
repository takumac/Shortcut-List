//
//  NotInstallAppView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/26.
//

import SwiftUI

struct NotInstallAppView: View {
    var body: some View {
        VStack {
            HStack {
                Text("あなたの端末にアプリがインストールされていない可能性があります。")
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            .padding(.trailing)
            HStack {
                Text("OSのバージョンを確認し、以下の方法を参考にご確認ください。")
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            .padding(.trailing)
            Form {
                Section("iOS14以降") {
                    Text("1. ホーム画面の一番右のホーム画面へ移動")
                    Text("2. もう一度右にスワイプしAppライブラリを表示")
                    Text("3. 上部の検索バーに対象のアプリケーション名を入力")
                    Text("4. 該当のアプリケーションが表示されていなければ未インストールとなります。")
                }
                .textCase(.none)
                Section("iOS13以前") {
                    Text("1. 【設定】アプリを起動")
                    Text("2. 「一般」を選択")
                    Text("3. 「iPhoneストレージ」を選択")
                    Text("4. 該当のアプリケーションが表示されていなければ未インストールとなります。")
                }
                .textCase(.none)
            }
            Spacer()
        }
    }
}

struct NotInstallAppView_Previews: PreviewProvider {
    static var previews: some View {
        NotInstallAppView()
    }
}
