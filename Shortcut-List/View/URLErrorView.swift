//
//  URLErrorView.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/07/26.
//

import SwiftUI

struct URLErrorView: View {
    var body: some View {
        VStack {
            HStack {
                Text("作成していただいたURLに誤りがある可能性があります。")
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            .padding(.trailing)
            HStack {
                Text("【ヘルプ】の【URL作成について】を参考にしてURLの再作成をお試しください。")
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            .padding(.trailing)
            
            Spacer()
        }
    }
}

struct URLErrorView_Previews: PreviewProvider {
    static var previews: some View {
        URLErrorView()
    }
}
