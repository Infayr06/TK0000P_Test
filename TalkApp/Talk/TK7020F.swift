//
//  MenuView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/16.
//

import SwiftUI

struct TK7020F: View {
    @State var showalert = false
    @State private var toGroupView = false
    @State private var selectionDate = Date()
    
    var dateFormat: DateFormatter {
      let format = DateFormatter()
      format.dateStyle = .full // .full | .long | .medium | .short | .none
      format.timeStyle = .full // .full | .long | .medium | .short | .none
      format.locale = Locale(identifier: "ja_JP")
      format.calendar = Calendar(identifier: .japanese)
      format.dateFormat = "YYYY年MM月dd日"
      return format
    }

var body: some View {
    // ページ全体
    ZStack(alignment: .top){
        VStack{
            ScrollView{
                // 退会までの部分
                VStack(){
                    Text("期間")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    HStack{
                        Text("\(dateFormat.string(from: selectionDate))まで")
                    }
                    .frame(width: 300, height: 30, alignment: .center)
            
                    // 管理者
                    VStack {
                        Text("管理者")
                            .font(.system(size: 20))
                            .fontWeight(.bold)

                        HStack(){
                            Image("icon01")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(100)
                                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.brown, lineWidth: 4))
                            Text("アカウント名")
                        }
                        .frame(width: 300, height: 50, alignment: .center)
                    }
                    Text("写真・画像")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    // ループで出来る？ 最新４枚
                    HStack(){
                        NavigationLink(destination: ImageView()){
                            Image("bgimg001")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        NavigationLink(destination: ImageView()){
                            Image("bgimg002")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        NavigationLink(destination: ImageView()){
                            Image("bgimg003")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        NavigationLink(destination: ImageView()){
                            Image("bgimg004")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                    }
                    NavigationLink(destination: PhotoView()){
                        Text("一覧をみる")
                    }
                    .padding(4)
        
                    Divider()
                
                    // 権限がある人のみ表示される、グループ設定は管理者のみ
                    // if ログインユーザが管理者だったら
                    VStack{
                        NavigationLink(destination: TK7030F()){
                            Text("グループ設定")
                        }
                        .padding(5)
                    
                        Divider()
                        
                        NavigationLink(destination: TK7040F()){
                            Text("メンバー一覧")
                        }
                        .padding(5)
                        
                        Divider()
                    }
                    Spacer()
                }
            VStack{
            Button(action: {showalert = true}) {
                Text("退会")
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            }
            .alert("本当に退会しますか？",isPresented: $showalert) {
                NavigationLink(destination: TK1010F()){
                    Button(action: {
                        self.showalert = true
                    },label: {
                        Text("はい")
                    })
                    NavigationLink(destination: TK1010F(),isActive: $toGroupView){
                        EmptyView()
                    }
                }
                Button(action: {
                }){
                    Text("いいえ")
                }
            }
            }
        }
    }
    .frame(maxWidth: .infinity,maxHeight: .infinity)
    
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarTitle("メニュー")//ナビの下にタイトル

}
}
}

struct TK7020F_Previews: PreviewProvider {
    @State static var groupChange = false
    static var previews: some View {
        TK7020F()
    }
}
