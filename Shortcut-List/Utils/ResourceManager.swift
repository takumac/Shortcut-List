//
//  ResourceManager.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/06/15.
//

import Foundation

/**
 * 各種リソースを管理するクラス。
 * シングルトン設計
 */
final public class ResourceManager {
    // シングルトンのシェアインスタンス
    public static let shared = ResourceManager()
    
    // JSONファイルから取得できたアプリケーションのURLを全て保持する変数
    private(set) static var allApplicationURL: [ApplicationURL] = []
    
    
    private init() {
        
    }
    
    /**
     * JSONファイルからショートカット対象のアプリケーションの情報を取得する
     */
    public func decodeAppInfo(jsonFileName: String) {
        // 対象ファイル検索
        guard let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") else {
            fatalError("アプリケーション定義ファイル(JSON)が見つかりません")
        }
        // 対象ファイルをData型プロパティに読み込み
        guard let data = try? Data(contentsOf: url) else {
            fatalError("アプリケーション定義ファイル(JSON)読み込みエラー")
        }
        // 対象ファイルのJSONデコード
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let applicationUrls = try? decoder.decode([ApplicationURL].self, from: data) else {
            fatalError("アプリケーション定義ファイルJSONデコードエラー")
        }
        // 対象となるアプリケーションの情報をメンバ変数に格納
        for applicationURL in applicationUrls {
            ResourceManager.allApplicationURL.append(ApplicationURL(appTitle: applicationURL.appTitle, appUrl: applicationURL.appUrl, /* 一時的に0を指定 */order: 0))
        }
    }
    
}
