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
    
    
    /**
      アプリケーション全体での初期化
     */
    init() {
        // Realm初期設定
        // JSONファイルからショートカット対象のアプリケーションの情報を取得
        ResourceManager.shared.decodeAppInfo(jsonFileName: "genuine_application_infomation")
        ResourceManager.shared.decodeAppInfo(jsonFileName: "beginning_I_application_infomation")
        ResourceManager.shared.decodeAppInfo(jsonFileName: "beginning_L_application_infomation")
        ResourceManager.shared.decodeAppInfo(jsonFileName: "beginning_T_application_infomation")
        ResourceManager.shared.decodeAppInfo(jsonFileName: "beginning_Y_application_infomation")
        
    }
}
