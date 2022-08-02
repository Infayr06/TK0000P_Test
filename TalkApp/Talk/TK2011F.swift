//
//  QRCodeShowView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/26.
//

import SwiftUI

// QRコード表示ページ

struct QRCodeShowView: View {
    
    @State var URL = "https://www.infas.cc"

    var body: some View {
            ZStack(){
            VStack(){
                Text("このQRコードを相手に見せてください")
                
                Image(uiImage: QRCode.makeQRImage(URL))
                
                .navigationBarTitle("QRコード表示")//ナビの下にタイトル
                .navigationBarTitleDisplayMode(.inline)


                Spacer()
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            }

        }
}

struct QRCodeShowView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeShowView()
    }
}
