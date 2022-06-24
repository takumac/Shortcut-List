//
//  ApplicationURL.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation
import UIKit

class ApplicationURL: Identifiable, Codable {
    var id = UUID()
    var appTitle: String
    var appUrl: String
    
    // JSONキー文字列設定
    private enum CodingKeys : CodingKey { case appTitle, appUrl }
    
    init (appTitle: String, appUrl: String) {
        self.appTitle = appTitle
        self.appUrl = appUrl
    }
    
    func openApp() {
        guard let url = URL(string: appUrl + "://") else {
            // TODO: URLオブジェクト作成に失敗した時の処理を実装する
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: { success in
                print("open \(success)")
            })
        }
    }
}
