//
//  TK2010F.swift
//  TalkApp
//  トーク画面
//
//  Created by kaihatsu on 2022/05/16.
//

import SwiftUI

// トークリスト用ダミー
struct Talk: Codable,Identifiable {
    let id: Int
    let name: String
    let body: String
}

typealias Talks = [Talk]
class TalkDownloader:ObservableObject{
    @Published var talks:Talks = [Talk]()
    
    init(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { return }
        URLSession.shared.dataTask(with: url){(data,response,error) in
            do {
                guard let data = data else { return }
                let talks = try JSONDecoder().decode(Talks.self,from: data)
                DispatchQueue.main.async {
                    self.talks = talks
                }
            } catch let jsonError as NSError {
                print("JSONDecode failed:\(jsonError.localizedDescription)")
            }
        }.resume()
    }
}
//ここまで(1)

struct TK2010F: View {
    @State var bodytext:String = ""
    @State var groupname :String = "あいう組"
    @State var username:String = "名前"
    @ObservedObject var talkData = TalkDownloader()
    
    var body: some View {
                
        ZStack(alignment: .top){
        VStack(){
            
            List(self.talkData.talks){ talk in
                // 所持しているユーザーキーとDBのユーザーキーが同じだった場合
                // デザインを通常のものと変更する
                
                // ダミーなのでとりあえずidが2だった場合
                if(talk.id == 2){
                    VStack(){
                        HStack(){
                            Spacer()
                            Image("icon01")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 3))
                        }

                        VStack(){
                            Text(talk.body)
                                .padding()
                        }
                            .frame(width: 300)
                            .cornerRadius(7)
                            .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray, lineWidth: 3))
                            .background(Color.blue)
                    }
                } else {
                    VStack(){
                        HStack(){
                            Image("icon01")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 3))

                            Text(talk.name)
                            Spacer()
                        }

                        VStack(){
                            Text(talk.body)
                                .padding()
                        }
                            .frame(width: 300)
                            .cornerRadius(7)
                            .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray, lineWidth: 3))
                            .background(Color.white)
                    }
                }
            }

//            ScrollView {
//                VStack(){ //トーク部分全体 スクロール用
//                    VStack(){ //一人の送信分
//                        HStack(){
//                            Image("icon01")
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                                .cornerRadius(100)
//                                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 3))
//                            Text(username)
//                            Spacer()
//                        }
//                        .padding()
//
//                        VStack(){
//                            Text(bodytext)
//                                .padding()
//                        }
//                        .frame(width: 300)
//                        .cornerRadius(7)
//                        .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray, lineWidth: 3))
//                        .background(Color.white)
//                    }
//                    .frame(width:350)
//                }
//            }
            
            Spacer()
            HStack(){
                TextEditor(text: $bodytext)
                    .frame(width:270,height: 40)
                    .background(Color.white)
                    .cornerRadius(5)

                Button(action: {}) {
                    Text("送信")
                        .frame(width: 35)
                        .padding(3)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(7)
                }
                Button(action: {}) {
                    Text("＋")
                        .padding(4)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(30)
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.all)
            .background(Color.headerColor)

        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
            
        // ナビゲーション設定
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(groupname)//ナビの下にタイトル
        .navigationBarItems(trailing:
                                HStack{
                                // QRコード読み取りアイコン
                                NavigationLink(destination: QRCodeShowView()){
                                    Image("QRcode")
                                        .resizable()
                                        .frame(width:30,height: 30)
                                }
                                //メニューアイコン
                                NavigationLink(destination: TK7020F()){
                                    Image("menu")
                                        .resizable()
                                        .frame(width:30,height: 25)
                                }
                                }
                                .frame(width:110))
            
        }

    }
}

struct TK2010F_Previews: PreviewProvider {
    static var previews: some View {
        TK2010F()
    }
}
