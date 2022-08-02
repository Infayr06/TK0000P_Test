//
//  TK7030F.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/16.
//

import SwiftUI

struct TK7030F: View {
    @State private var text = ""
    @State private var selectionDate = Date()
    @State var groupname: String = ""
    @State var groupexpo: String = ""
    @State var Imgtemp:String = "icon01"
    @State var iconch:String = ""
    @State private var showingModal = false
    @State private var bgColor = Color.white
    
    var body: some View {

        ZStack(){
            ScrollView {
        VStack(){
            
            
            VStack(){
                Text("グループ名")
                TextField("", text: $groupname)
                    .frame(width: 260.0, height: 30.0)
                    .padding(.all, 6)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))
                    .cornerRadius(6)
            }
            .frame(maxWidth: .infinity,maxHeight: 80)
            .multilineTextAlignment(.center)
            .padding(.all,15)

            VStack(){
                
                if Imgtemp == "icon01"{
                    ZStack{
                        Circle()
                            .foregroundColor(bgColor)
                            .frame(width: 140, height: 140)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                        
                        Image("icon01")
                            .resizable()
                            .frame(width: 140, height: 140)
                            .cornerRadius(100)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                    }

                } else if Imgtemp == "icon02"{
                    ZStack{
                        Circle()
                            .foregroundColor(bgColor)
                            .frame(width: 140, height: 140)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                        
                        Image("icon02")
                            .resizable()
                            .frame(width: 140, height: 140)
                            .cornerRadius(100)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                    }
                } else if Imgtemp == "icon03"{
                    Image("bgimg001")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(100)
                        .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                }
                    
                
            }
            .padding(.all)
            
            VStack{
            Button(action: {
                self.showingModal.toggle()
            }){
                Text("テンプレートから選択")
                    .font(.system(size: 16,weight: .bold
                                  ,design: .rounded))
            }
            .sheet(isPresented: $showingModal){
                ImageChooseView(Imgtemp: $Imgtemp, iconch: $iconch)
            }
            .foregroundColor(Color.white)
            .padding(.all, 12.0)
            .frame(width: 230,height: 35)
            .background(Color.buttonColor1)
            .cornerRadius(10)
                
            }
            .padding(.bottom, 10.0)
            ColorPicker("背景色", selection: $bgColor)
                .frame(width: 200)
                .padding(.bottom, 9)
            
            Divider()
            
            VStack(alignment:.center){
                Text("期間")
                HStack(alignment:.center){
                    DatePicker(
                      "",
                      selection: $selectionDate,
                      displayedComponents: .date
                    )
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .frame(width:120, alignment: .center)
                    Text("まで")
                }
            }
            .frame(maxWidth: .infinity,maxHeight: 80)
            .multilineTextAlignment(.center)
            
            Button(action: {}){
                Text("完了")
            }
            .foregroundColor(Color.white)
            .padding(.all, 12.0)
            .frame(width: 160,height: 35)
            .background(Color.buttonColor1)
            .cornerRadius(10)
            //完了したらグループに追加する・保存する

            .navigationBarTitle("グループ設定")//ナビの下にタイトル
            .navigationBarTitleDisplayMode(.inline)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.white)
    }
}

struct TK7030F_Previews: PreviewProvider {
    static var previews: some View {
        TK7030F()
    }
}
