//
//  ContentView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/12.
//

import SwiftUI

struct TK9010F: View {
    var body: some View {
        NavigationView{
        ZStack{
            VStack(){
                Text("TALK")
                    .foregroundColor(Color.headerColor)
                    .font(.system(size: 50,weight: .bold,design: .default))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                VStack(spacing: 10){
                    Text("アカウント登録")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                        Text("電話番号")
                            .multilineTextAlignment(.leading)
                            .frame(width: 300.0)
                            .padding(.bottom,5)
                        TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .frame(width: 260.0, height: 30.0)
                            .padding(.all, 6)
                            //.border(Color.black, width: 1)
                            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))

                        // ボタン
                        Button(action: {}) {
                            Text("認証コード送信")
                                .foregroundColor(Color.white)
                                .padding(.all, 12.0)
                                .frame(width: 200)
                        }
                        .padding(.top,5)
                        .background(Color.buttonColor2)
                        .cornerRadius(6)
                                                
                        Text("認証コード")
                            .multilineTextAlignment(.leading)
                            .frame(width: 300.0)
                            .padding(.bottom,5)
                            .padding(.top,4)
                        TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .frame(width: 260.0, height: 30.0)
                            .padding(.all, 6)
                            //.border(Color.black, width: 1)
                            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))
                    
                    NavigationLink(destination: TK7010F()) {
                        Text("登録")
                            .foregroundColor(Color.white)
                            .frame(width: 170)
                    }
                    .padding(.all, 12.0)
                    .frame(width: 170.0)
                    .background(Color.buttonColor1)
                    .cornerRadius(6)
                    
                    .navigationBarHidden(true)
                }
                .frame(width:320,height: 400)
                .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.black,lineWidth: 4))
                .background(Color.white)
                }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.white)
        }
    }
    }

struct TK9010F_Previews: PreviewProvider {
    static var previews: some View {
        TK9010F()
    }
}
