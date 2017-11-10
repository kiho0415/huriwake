//
//  kekkaViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2017/08/20.
//  Copyright © 2017年 森田貴帆. All rights reserved.
//

import UIKit

class kekkaViewController: UIViewController,UITableViewDataSource {
    
    //ViewControllerから受け取るための変数
    var hazime: String = ""
    var owari: String = ""
    var nissuu: String = ""
    var kekkaText: String = ""
    
    var hazimenumber: Int = 0
    var owarinumber: Int = 0
    var nissuunumber: Int = 1
    var kekkanumber: Int = 0
    var kekkaamari: Int = 0
    
    //配列
    var kekkaArray = [String]()
    
    //StoryBoadで使うtableViewを宣言
    @IBOutlet var table:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメッソドはViewCOntrollerのクラスに書くよ、という設定
        table.dataSource = self
        
        
        if Int(hazime) != nil {
            hazimenumber = Int(hazime)!
        }
        
        if Int(owari) != nil {
            owarinumber = Int(owari)!
        }
        
        if Int(nissuu) != nil {
            nissuunumber = Int(nissuu)!
        }
       
        kekkanumber = ( owarinumber - hazimenumber + 1 ) / nissuunumber
        kekkaamari = ( owarinumber - hazimenumber + 1 ) % nissuunumber
    
        
        //配列に結果を表示
        if kekkaamari == 0 {
            for i in 1...nissuunumber {
                
                kekkaArray.append("\(i)日目 　\(hazimenumber)〜\(hazimenumber + (kekkanumber - 1))ページ")
                hazimenumber = hazimenumber + (kekkanumber - 1) + 1
            }
        }else{
            for k in 1...kekkaamari {
                kekkaArray.append("\(k)日目 　\(hazimenumber)〜\(hazimenumber + (kekkanumber + 1 - 1))ページ")
                hazimenumber = hazimenumber + (kekkanumber + 1 - 1) + 1
            }
            for m in kekkaamari + 1...nissuunumber {
                 kekkaArray.append("\(m)日目 　\(hazimenumber)〜\(hazimenumber + (kekkanumber - 1))ページ")
                hazimenumber = hazimenumber + (kekkanumber - 1) + 1
            }
        }
        table.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kekkaArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに結果を表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = kekkaArray[indexPath.row]
        
        return cell!
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
