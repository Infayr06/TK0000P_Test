//
//  ShosaiView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/16.
//

import SwiftUI

struct ShosaiView: View {
    @State private var selectionDate = Date()
    
    var body: some View {
        ZStack(){
        VStack(){
            Spacer()
        VStack(){
            Image("bgimg002")//グループアイコン
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black, lineWidth: 9))
            Text("グループ名")

            VStack(){
                Text("期間")
                HStack{
                    Text("\(selectionDate)まで")
                }
            }
            Text("管理者")
            HStack(){
                Image("icon01")
                    .resizable()
                    .frame(minWidth: 40,maxWidth: 70, minHeight: 40,maxHeight: 70)
                    .cornerRadius(100)
                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.brown, lineWidth: 4))
                Text("アカウント名")
            }
            Text("説明")
            Spacer()
            
                .navigationBarTitle("グループ詳細")//ナビの下にタイトル
                .navigationBarTitleDisplayMode(.inline)
        }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(hue: 0.524, saturation: 0.117, brightness: 0.988))
    }
}

struct ShosaiView_Previews: PreviewProvider {
    static var previews: some View {
        ShosaiView()
    }
}
