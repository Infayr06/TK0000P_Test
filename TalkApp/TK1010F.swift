//
//  TK1010F.swift
//  TalkApp
//  グループ一覧
//
//  Created by kaihatsu on 2022/05/12.
//

import SwiftUI

extension UIColor{
    static func naviColor() -> UIColor{
        return UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1.0)
    }
}

//　グループ一覧用ダミー
struct Test: Codable,Identifiable {
    let userId,id: Int
    let title: String
}

typealias Tests = [Test]
class TestDownloader:ObservableObject {
    @Published var tests:Tests = [Test]()
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        print(url)
        URLSession.shared.dataTask(with: url){(data,response,error) in
            do{
                guard let data = data else { return }
                let tests = try JSONDecoder().decode(Tests.self, from: data)
                DispatchQueue.main.async {
                    self.tests = tests
                }
            } catch let jsonError as NSError {
                print("JSONDecode failed:\(jsonError.localizedDescription)")
            }
        }.resume()
    }
}
// ダミーここまで

//struct Groups: Identifiable {
//    var id: Int
//    var name: String
//    var icon: String
//    var togglefl: Bool
//}



struct TK1010F: View {
    
    init(){
        UINavigationBar.appearance().barTintColor = UIColor.naviColor()
        UINavigationBar.appearance().titleTextAttributes = [ .foregroundColor: UIColor.gray]
        UINavigationBar.appearance().tintColor = .gray
    }
    
    @State var count:Int = 1
    @State var group = false
    @State var captureImage: UIImage? = nil
    @State var isShowSheet = false
    @ObservedObject var viewModel = ScannerViewModel()
    // ダミー用
    @ObservedObject var testData = TestDownloader()

    var body: some View {
    
        ZStack(alignment:.top){
        VStack{
            // グループ一覧ダミーView
            List(self.testData.tests){ test in
                HStack(){
                    NavigationLink(destination: TK2010F()){
                        Image("bgimg001")
                            .resizable()
                            .frame(width: 50,height: 50,alignment: .leading)
                            .cornerRadius(100)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 3))
                        
                        Text(test.title)
                    }
                }
                .padding()
                .aspectRatio(contentMode: .fit)
            }
            .listStyle(InsetListStyle())
            // ダミーここまで
            
//            List(groupList) { groupList in
//                HStack(){
//                    NavigationLink(destination: TK2010F()){
//                        Image(groupList.icon)// アイコン
//                                .resizable()
//                                .frame(width: 50,height: 50,alignment: .leading)
//                                .cornerRadius(100)
//                                .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.headerColor, lineWidth: 3))
//                        Text(groupList.name)
//                                .frame(width: 230,alignment: .leading)
//                    }
//                }
//                .padding()
//                .aspectRatio(contentMode: .fit)
//            }
//            .listStyle(InsetListStyle())

                //　下ナビゲーション
            ZStack(alignment: .bottom){
            HStack(){
                Button(action: {}){
                    Image("Talk2")
                        .resizable()
                        .frame(width: 42, height: 40)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                    
                Divider()
                
                NavigationLink(destination: TK7010F()) {
                    Image("Mypage")
                        .resizable()
                        .frame(width: 37, height: 43)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity,maxHeight: 80)
            .background(Color.white)
            }
            
            
            }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
            
        // ナビゲーション設定
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("グループ")//ナビの下にタイトル
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            // 左側
            leading:
                NavigationLink(destination: TK7030F()){
                    Image("Talkplus")
                        .resizable()
                        .frame(width:41,height: 35)
                }
                .frame(width:110)
                
//                Button(action: {
//                    viewModel.isShowing = true
//                }){
//                    Image("CodeReader")
//                        .resizable()
//                        .frame(width:35,height: 35)
//                }
//                .frame(width:110,height: 60)
//                .fullScreenCover(isPresented: $viewModel.isShowing) {
//                    SecondView(viewModel: viewModel)
//                }
            // 右側
            , trailing:
                Button(action: {
                    viewModel.isShowing = true
                }){
                    Image("CodeReader")
                        .resizable()
                        .frame(width:35,height: 35)
                }
                .frame(width:110,height: 60)
                .fullScreenCover(isPresented: $viewModel.isShowing){
                    SecondView(viewModel: viewModel)
                }
            
//                    NavigationLink(destination: GroupCreateView()){
//                        Image("Talkplus")
//                            .resizable()
//                            .frame(width:41,height: 35)
//                    }
//                    .frame(width:110))
            )
        }
    }
    }

struct TK1010F_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TK1010F()
        }
    }
}

