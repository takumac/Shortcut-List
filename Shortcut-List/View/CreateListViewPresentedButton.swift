//
//  CreateListViewPresentedButton.swift
//  Shortcut-List
//
//  Created by Takumi Sakai on 2022/05/27.
//

import SwiftUI

struct CreateListViewPresentedButton: View {
    @State var isShowingView: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    isShowingView.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .cornerRadius(30.0)
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 20))
                }
                .sheet(isPresented: $isShowingView) {
                    CreateListView()
                }
            }
        }
    }
}

//struct CreateListViewPresentedButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateListViewPresentedButton(isShowingView: false)
//            .previewLayout(.sizeThatFits)
//    }
//}
