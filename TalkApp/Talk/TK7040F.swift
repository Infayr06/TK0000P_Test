//
//  TK7040F.swift
//  TalkApp
//  メンバー一覧
//
//  Created by kaihatsu on 2022/05/16.
//

import SwiftUI

// メンバー一覧　ダミー
struct Member: Codable,Identifiable {
    let id: Int
    let name: String
    let username: String
}

typealias Members = [Member]
class MemberDownloader:ObservableObject{
    @Published var members:Members = [Member]()
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        print(url)
        URLSession.shared.dataTask(with: url){(data,response,error) in
            do{
                guard let data = data else { return }
                let members = try JSONDecoder().decode(Members.self, from: data)
                DispatchQueue.main.async {
                    self.members = members
                }
            } catch let jsonError as NSError {
                print("JSONDecode failed:\(jsonError.localizedDescription)")
            }
        }.resume()
    }
}
// ダミーここまで

struct TK7040F: View {
    @State var showalert = false
    @State var Admini = false
    @State var Admini2 = false
    @ObservedObject var memberData = MemberDownloader()

    var body: some View {
        
        List(self.memberData.members){ member in
            HStack(){
                Image("icon01")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .cornerRadius(100)
                    .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.brown, lineWidth: 5))
                
                Text(member.username)
                Spacer()
                Toggle(isOn: $Admini) {
                    Text("権限")
                }
                .frame(width:100)
                
                Button(action: {showalert = true}) {
                    Text("×")
                        .font(.system(size: 50,weight: .bold,design: .rounded))
                        .foregroundColor(Color.red)
                        .frame(width: 50,height: 50)
                }
            }
        }
    }
}

struct TK7040F_Previews: PreviewProvider {
    static var previews: some View {
        TK7040F()
    }
}
