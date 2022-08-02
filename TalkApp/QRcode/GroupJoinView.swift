//
//  GroupJoinView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/25.
//

import SwiftUI

// コード読んだら表示するページ

struct GroupJoinView: View {
    
    @ObservedObject var viewModel : ScannerViewModel
    
    var body: some View {
        VStack(){
            Image("bgimg002")//グループアイコン
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black, lineWidth: 9))
            
            Text("グループ名")
            
            Button(action: {}){
                Text("参加")
            }
            
        }
    }
}

