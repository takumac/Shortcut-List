//
//  ApplicationURL.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation
import RealmSwift

class ApplicationURL: Object, Identifiable, Codable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var appTitle: String
    @Persisted var appUrl: String
    @Persisted var order: Int
    
    // JSONキー文字列設定
    private enum CodingKeys : CodingKey { case appTitle, appUrl }
    
    override init() {
        super.init()
    }
    
    init(appTitle: String, appUrl: String, order: Int) {
        self.appTitle = appTitle
        self.appUrl = appUrl
        self.order = order
    }
    
    init(id: UUID, appTitle: String, appUrl: String, order: Int) {
        self.id = id
        self.appTitle = appTitle
        self.appUrl = appUrl
        self.order = order
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
