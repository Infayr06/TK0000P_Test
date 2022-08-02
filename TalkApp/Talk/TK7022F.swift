//
//  ImageView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/19.
//

import SwiftUI


struct ImageView: View {
    var body: some View {
        ZStack(){
        VStack(){
            Image("bgimg001") //選択した画像
        }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.headerColor)

    }
    
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
