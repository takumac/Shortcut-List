//
//  Shortcut_ListApp.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import SwiftUI

@main
struct Shortcut_ListApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
    
    init() {
        // アプリケーション全体での初期化
        // Realm初期設定
        // JSONファイルからショートカット対象のアプリケーションの情報を取得
        ResourceManager.shared.decodeAppInfo()
        
    }
}
