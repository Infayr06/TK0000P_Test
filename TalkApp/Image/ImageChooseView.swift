//
//  ImageChooseView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/23.
//

import SwiftUI

struct ImageChooseView: View {
    @Binding var Imgtemp: String //アイコンテンプレ
    @Binding var iconch: String // アイコンがテンプレかフォトか
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(){
            VStack(){
                HStack(){
                    Button(action: {
                        iconch = "temple"
                        Imgtemp = "icon01"
                        dismiss()
                    }){
                        Image("icon01")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(100)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                    }
                    Button(action: {
                        iconch = "temple"
                        Imgtemp = "icon02"
                        dismiss()
                    }){
                        Image("icon02")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(100)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                    }
                    Button(action: {
                        iconch = "temple"
                        Imgtemp = "icon03"
                        dismiss()
                    }){
                        Image("bgimg001")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(100)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 5))
                    }
                }
            }
            
            
        }
    }
}

struct ImageChooseView_Previews: PreviewProvider {
    @State static var Imgtemp = ""
    @State static var iconch = ""
    static var previews: some View {
        ImageChooseView(Imgtemp: $Imgtemp, iconch: $iconch)
    }
}
