//
//  MypageView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/12.
//

import SwiftUI
import UserNotifications
import CoreData

//自作カラー
extension Color{
    static let ashblue = Color("ashblue")
    static let dovegray = Color("dovegray")
    static let dandelion = Color("dandelion")
    static let blueslate = Color("blueslate")
    static let headerColor = Color("headerColor")
    static let buttonColor1 = Color("buttonColor1")
    static let buttonColor2 = Color("buttonColor2")
    static let textfieldColor = Color("textfieldColor")
}

struct MypageView: View {

    
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
    
    func makeNotification(){
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let contect = UNMutableNotificationContent()
        contect.title = "ローカル通知"
        contect.body = bodytext
        contect.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: "notification001", content: contect, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request,withCompletionHandler: nil)
        
    }
    
    var body: some View {
        ZStack{
            VStack(){
                ScrollView {
                VStack(){
                    VStack(alignment:.center){

                        Divider()
                        
                        VStack{
                        Text("基本設定")
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
                        
                        
                        VStack{
                        
                            HStack{
                            Text("アプリの通知")
                                .frame(width: 200,alignment: .leading)
                            Toggle(isOn: $Appnoti) {
                                
                            }
                            .frame(width: 40)
                            }
                                
                        // テスト
                        
                            Button(action: {
                                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]){
                                    (granted, _) in
                                    if granted {
                                        makeNotification()
                                    }
                                }
                            }){
                                Text("５秒後に通知を送る")
                            }
                        
                        }
                        
                        // テスト終わり
                        
                        VStack{
                            
                            Divider()
                            
                            Text("本人情報")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.headerColor)
                                .frame(height: 40.0)
                            
                            Divider()
                            
                            Text("メールアドレス")
                                .multilineTextAlignment(.leading)
                                .frame(width: 300)
                            TextField("あいう", text: $mailadd)
                                .frame(width: 260.0, height: 27.0)
                                .padding(.all, 6)
                                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))
                                .cornerRadius(6)
                            Text("電話番号")
                                .multilineTextAlignment(.leading)
                                .frame(width: 300)
                            TextField("", text: $phonenum)
                                .frame(width: 260.0, height: 27.0)
                                .padding(.all, 6)
                                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))
                                .cornerRadius(6)
                                
                                // ボタン
                                Button(action: {}) {
                                    Text("認証コード送信")
                                        .foregroundColor(Color.white)
                                        .frame(width: 160)
                                }
                                .frame(width: 170.0)
                                .padding(.all, 12.0)
                                .background(Color.buttonColor2)
                                .cornerRadius(6)

                            Text("認証コード")
                                .multilineTextAlignment(.leading)
                                .frame(width: 300)
                            TextField("", text: $nishcd)
                                .frame(width: 260.0, height: 27.0)
                                .padding(.all, 6)
                                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))
                                .cornerRadius(6)
                        }
                        
                        VStack(){
                            Divider()
                            Spacer()
                            Button(action: {
                                
                            }){
                                Text("変更を保存")
                                    .foregroundColor(Color.white)
                                    .frame(width: 160)
                            }
                            .padding(.all, 12.0)
                            .frame(width: 170.0)
                            .background(Color.buttonColor1)
                            .cornerRadius(6)
                        }
                        .frame(height: 60.0)
                        .padding(.top,  10.0)

                        }
                    .padding(.bottom)
                }
                .frame(width: 380)
                }
                
                ZStack(alignment: .bottom){
                // ナビゲーション
                HStack(){
                    NavigationLink(destination: GroupView()) {
                        Image("Talk1")// トークimg
                            .resizable()
                            .frame(width: 42, height: 40)
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                        
                    Divider()
                    
                    Button(action: {}){
                        Image("Mypage2")
                            .resizable()
                            .frame(width: 37, height: 43)
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity,maxHeight: 80)
                .background(Color.white)
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }

        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("マイページ")//ナビの下にタイトル
        .navigationBarBackButtonHidden(true)

    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MypageView()
        }
    }
}

