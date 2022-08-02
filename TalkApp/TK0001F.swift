//
//  TK0001F.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/07/22.
//

import SwiftUI

struct TK0001F: View {
    var body: some View {
        NavigationView{
        ZStack{
            VStack(){
                Text("アプリ名")
                    .foregroundColor(Color.headerColor)
                    .font(.system(size: 50,weight: .bold,design: .default))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                VStack(spacing: 10){
                        Text("ユーザーID")
                            .multilineTextAlignment(.leading)
                            .frame(width: 300.0)
                            .padding(.bottom,5)
                        TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .frame(width: 260.0, height: 30.0)
                            .padding(.all, 6)
                            //.border(Color.black, width: 1)
                            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.965))

                        Text("パスワード")
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
                        Text("ログイン")
                            .foregroundColor(Color.white)
                            .frame(width: 170)
                    }
                    .padding(.all, 12.0)
                    .frame(width: 170.0)
                    .background(Color.buttonColor1)
                    .cornerRadius(6)
                    
                    NavigationLink(destination: TK9010F()) {
                        Text("アカウント新規登録")
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

struct TK0001F_Previews: PreviewProvider {
    static var previews: some View {
        TK0001F()
    }
}
