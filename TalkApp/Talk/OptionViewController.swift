//
//  OptionViewController.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/20.
//

import UIKit

class OptionViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView = UITableView()
    var array: [String] = ["スタンプ","画像・動画","アンケート"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default,reuseIdentifier: "cell")
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
}

//extension OptionViewController: ModalPresentable{
//
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .lightContent
//    }
//
//    var panScrollable: UIScrollView?{
//        return nil
//    }
//
//    var longFormHeight: ModalHeight{
//        return .contentHeight(100)
//    }
//
//    var anchorModalToLongForm: Bool{
//        return false
//    }
    
//}
