//
//  PhotoView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/16.
//

import SwiftUI


struct PhotoView: View {
    var body: some View {
        
        //　グリッドのリストにする

        ZStack(alignment: .top){
        ScrollView {
        VStack(){
            VStack{
                HStack(){
                    NavigationLink(destination: ImageView()){
                        Image("bgimg001")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    NavigationLink(destination: ImageView()){
                    Image("bgimg002")
                        .resizable()
                        .frame(width: 100, height: 100)
                    }
                    NavigationLink(destination: ImageView()){
                    Image("bgimg003")
                        .resizable()
                        .frame(width: 100, height: 100)
                    }
                    }
                HStack(){
                    NavigationLink(destination: ImageView()){
                        Image("bgimg004")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    NavigationLink(destination: ImageView()){
                    Image("bgimg001")
                        .resizable()
                        .frame(width: 100, height: 100)
                    }
                    NavigationLink(destination: ImageView()){
                    Image("bgimg002")
                        .resizable()
                        .frame(width: 100, height: 100)
                    }
                    }
                HStack(){
                    NavigationLink(destination: ImageView()){
                        Image("bgimg003")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    NavigationLink(destination: ImageView()){
                    Image("bgimg004")
                        .resizable()
                        .frame(width: 100, height: 100)
                    }
                    NavigationLink(destination: ImageView()){
                    Image("bgimg001")
                        .resizable()
                        .frame(width: 100, height: 100)
                    }
                    }
                }
         Spacer()
        }
        }
        }
            .navigationBarTitle("写真・動画")//ナビの下にタイトル
            .navigationBarTitleDisplayMode(.inline)
        }
    }

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
