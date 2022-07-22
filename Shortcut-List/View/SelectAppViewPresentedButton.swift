//
//  FloatingButton.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/24.
//

import SwiftUI

struct SelectAppViewPresentedButton: View {
    @State var isShowingConfirmationDialog: Bool = false
    @State var isShowingSelectAppView: Bool = false
    @State var isShowingCreateUrlView: Bool = false
    
    @Binding var applicationURLs: [ApplicationURL]
    
    //モーダル表示から戻る際に実行するクロージャ
    let onDismissProc:(() -> Void)?
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    isShowingConfirmationDialog.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.floatingButtonBackgroundColor)
                        .cornerRadius(30.0)
                        .shadow(color: .floatingButtonShadowColor, radius: 3, x: 3, y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 20))
                }
                .confirmationDialog("タイトルなし", isPresented: $isShowingConfirmationDialog, actions: {
                    Button("アプリを選択") {
                        isShowingSelectAppView.toggle()
                    }
                    Button("URLを作成") {
                        isShowingCreateUrlView.toggle()
                    }
                })
                // アプリ選択画面へ
                .sheet(isPresented: $isShowingSelectAppView, onDismiss: {
                    if let dismissProc = self.onDismissProc {
                        dismissProc()
                    }
                }) {
                    SelectAppView(applicationURLs: $applicationURLs)
                }
                // URL作成画面へ
                .sheet(isPresented: $isShowingCreateUrlView, onDismiss: {
                    if let dismissProc = self.onDismissProc {
                        dismissProc()
                    }
                }, content: {
                    CreateURLView(applicationURLs: $applicationURLs)
                })
            }
        }
    }
}

//struct SelectAppViewPresentedButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectAppViewPresentedButton(isShowingView: false, applicationURLs: selectAppViewTestData)
//            .previewLayout(.sizeThatFits)
//    }
//}
