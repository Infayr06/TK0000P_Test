//
//  Myaccount.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/07/25.
//

import SwiftUI
import CoreData

struct Myaccount: View {
    @State var Appnoti = true //アプリ通知
    @State var Imgtemp:String = ""
    @State var username:String = ""
    @State var phonenum:String = ""
    @State var mailadd:String = ""
    @State var nishcd :String = ""
    @State private var bgColor = Color.white
    @State private var showingModal = false
    @State var showingImagePicker = false
    @State private var icon: UIImage?
    @State var bodytext:String = "本文です" //データベースから持ってくる
    @State var iconch:String = ""
    
    var body: some View {
        ZStack{
            VStack(){
                ScrollView {
                VStack(){
                    VStack(alignment:.center){

                        Divider()
                        
                        VStack{
                        Text("アカウント設定")
                                .foregroundColor(Color.headerColor)
                                .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(height: 40.0)
                        }
                        
                        Divider()
                        
                        VStack{
                            Text("アカウント名")
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .frame(width: 300)
                            TextField("", text: $username)
                                .frame(width: 260.0, height: 30.0)
                                .padding(.all, 6)
                                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))
                                .cornerRadius(6)
                        }
                        
                        Spacer()
                        
                        // アイコン
                        VStack(){
                        if iconch == "temple" {
                            if Imgtemp == "icon01"{
                                ZStack{
                                    Circle()
                                        .foregroundColor(bgColor)
                                        .frame(width: 140, height: 140)
                                    
                                    Image("icon01")
                                        .resizable()
                                        .frame(width: 140, height: 180)
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                                }
                            } else if Imgtemp == "icon02"{
                                ZStack{
                                    Circle()
                                        .foregroundColor(bgColor)
                                        .frame(width: 140, height: 140)
                                    
                                    Image("icon02")
                                        .resizable()
                                        .frame(width: 140, height: 140)
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                                }
                            } else if Imgtemp == "icon03"{
                                ZStack{
                                    Image("bgimg001")
                                        .resizable()
                                        .frame(width: 140, height: 140)
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                                }
                            } else {
                                Image("NoImage")
                                    .resizable()
                                    .frame(width: 140, height: 140)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                            }
                        } else if iconch == "photo" {
                            if let uiImage = icon {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 140, height: 140)
                                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                            } else {
                                Image("NoImage")
                                    .resizable()
                                    .frame(width: 140, height: 140)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                            }
                        } else {
                            Image("NoImage")
                                .resizable()
                                .frame(width: 140, height: 140)
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                        }
                        }
                        .padding()
                        
                    
                        VStack(spacing: 10){
                            
                            Button(action: {
                                self.showingModal.toggle()
                            }){
                                Text("テンプレート")
                                    .fontWeight(.bold)
                            }
                            .sheet(isPresented: $showingModal){
                                ImageChooseView(Imgtemp: $Imgtemp, iconch: $iconch)
                            }
                            .foregroundColor(Color.white)
                            .padding(.all, 12.0)
                            .frame(width: 230)
                            .background(Color.buttonColor1)
                            .cornerRadius(10)
                            
                            Button(action: {
                                showingImagePicker = true
                                iconch = "photo"
                            }){
                                Text("フォトライブラリ")
                                    .fontWeight(.bold)
                            }
                            .sheet(isPresented: $showingImagePicker){
                                ImagePicker(sourceType: .photoLibrary, selectedImage: $icon)
                            }
                            .foregroundColor(Color.white)
                            .padding(.all, 12.0)
                            .frame(width: 230)
                            .background(Color.buttonColor1)
                            .cornerRadius(10)
                            
                            ColorPicker("背景色", selection: $bgColor)
                                .frame(width: 200)
                        }
                        
                        VStack(){
                            Divider()
                            Spacer()
                            NavigationLink(destination: TK2010F()) {
                                Text("参加")
                                    .foregroundColor(Color.white)
                                    .frame(width: 170)
                                    .font(.system(size: 15,design: .default))
                            }
                            .padding(.all, 12.0)
                            .frame(width: 170.0)
                            .background(Color.buttonColor1)
                            .cornerRadius(6)
                            .navigationBarHidden(true)

                        }
                        .frame(height: 60.0)
                        .padding(.top,  10.0)

                        }
                    .padding(.bottom)
                }
                .frame(width: 380)
                }
            }

        }
    }
}

struct Myaccount_Previews: PreviewProvider {
    static var previews: some View {
        Myaccount()
    }
}
