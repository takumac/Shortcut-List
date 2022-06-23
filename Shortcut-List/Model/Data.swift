//
//  Data.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import Foundation

let mainViewTestData = [
    ShortcutList(title: "title1", description: "description1", applicationURLs: [ApplicationURL(appTitle: "app1", appUrl: "url1"), ApplicationURL(appTitle: "app2", appUrl: "url2"), ApplicationURL(appTitle: "app3", appUrl: "url3")]),
    ShortcutList(title: "title2", description: "description2", applicationURLs: [ApplicationURL(appTitle: "app4", appUrl: "url4"), ApplicationURL(appTitle: "app5", appUrl: "url5"), ApplicationURL(appTitle: "app6", appUrl: "url6")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")]),
    ShortcutList(title: "title3", description: "description3", applicationURLs: [ApplicationURL(appTitle: "app7", appUrl: "url7"), ApplicationURL(appTitle: "app8", appUrl: "url8"), ApplicationURL(appTitle: "app9", appUrl: "url9")])
]

let createViewTestData = [
    ApplicationURL(appTitle: "createView title1", appUrl: "createView url1"),
    ApplicationURL(appTitle: "createView title2", appUrl: "createView url2"),
    ApplicationURL(appTitle: "createView title3", appUrl: "createView url3"),
    ApplicationURL(appTitle: "createView title4", appUrl: "createView url4"),
    ApplicationURL(appTitle: "createView title5", appUrl: "createView url5")
]

let listDetailViewTestData = ShortcutList(
        title: "title1",
        description: "description1",
        applicationURLs: [
                ApplicationURL(appTitle: "app1", appUrl: "url1"),
                ApplicationURL(appTitle: "app2", appUrl: "url2"),
                ApplicationURL(appTitle: "app3", appUrl: "url3")
            ]
    )

let selectAppViewTestData = [
    ApplicationURL(appTitle: "selectAppView title1", appUrl: "selectAppView url1"),
    ApplicationURL(appTitle: "selectAppView title2", appUrl: "selectAppView url2"),
    ApplicationURL(appTitle: "selectAppView title3", appUrl: "selectAppView url3"),
    ApplicationURL(appTitle: "selectAppView title4", appUrl: "selectAppView url4"),
    ApplicationURL(appTitle: "selectAppView title5", appUrl: "selectAppView url5")
]

let testData = [
    ShortcutList(title: "ショートカット1", description: "メール・メッセージ・Music", applicationURLs: [ApplicationURL(appTitle: "メール", appUrl: "message"), ApplicationURL(appTitle: "メッセージ", appUrl: "sms"), ApplicationURL(appTitle: " Music", appUrl: "music")]),
    ShortcutList(title: "ショートカット2", description: "写真・マップ・AppStore", applicationURLs: [ApplicationURL(appTitle: "写真", appUrl: "photos-redirect"), ApplicationURL(appTitle: "マップ", appUrl: "maps"), ApplicationURL(appTitle: "AppStore", appUrl: "itms-apps://itunes.apple.com/jp/genre/id36")]),
    ShortcutList(title: "ショートカット3", description: "iTunesStore・カレンダー・リマインダー", applicationURLs: [ApplicationURL(appTitle: "iTunesStore", appUrl: "itms://itunes.apple.com/jp/"), ApplicationURL(appTitle: "カレンダー", appUrl: "calshow"), ApplicationURL(appTitle: "リマインダー", appUrl: "x-apple-reminder")]),
]
