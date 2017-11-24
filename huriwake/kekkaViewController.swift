//
//  kekkaViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2017/08/20.
//  Copyright © 2017年 森田貴帆. All rights reserved.
//

import UIKit

class kekkaViewController: UIViewController,UITableViewDataSource {
    
    var hazime: String = ""
    var owari: String = ""
    var nissuu: String = ""
    var kyozai: String = ""
    var kekkaText: String = ""
    
    var hnumber: Int = 0
    var onumber: Int = 0
    var nnumber: Int = 1
    var knumber: Int = 0
    var kamari: Int = 0
    
    //配列
    var kekkaArray = [String]()
    
    //StoryBoadで使うtableViewを宣言
    @IBOutlet var table:UITableView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //読み込み
        kyozai = (saveData.object(forKey: "kyozai") as? String)!
        hazime = (saveData.object(forKey: "hazime") as? String)!
        owari = (saveData.object(forKey: "owari") as? String)!
        nissuu = (saveData.object(forKey: "nissuu") as? String)!
        //テーブルビューのデータソースメッソドはViewCOntrollerのクラスに書くよ、という設定
        table.dataSource = self
        
        
        if Int(hazime) != nil {
            hnumber = Int(hazime)!
        }
        
        if Int(owari) != nil {
            onumber = Int(owari)!
        }
        
        if Int(nissuu) != nil {
            nnumber = Int(nissuu)!
        }
       
        knumber = ( onumber - hnumber + 1 ) / nnumber
        kamari = ( onumber - hnumber + 1 ) % nnumber
    
        
        //配列に結果を表示
        if kamari == 0 {
            for i in 1...nnumber {
                
                kekkaArray.append("\(i)日目 　\(kyozai) \(hnumber)〜\(hnumber + (knumber - 1))ページ")
                hnumber = hnumber + (knumber - 1) + 1
            }
        }else{
            for k in 1...kamari {
                kekkaArray.append("\(k)日目 　\(kyozai) \(hnumber)〜\(hnumber + (knumber + 1 - 1))ページ")
                hnumber = hnumber + (knumber + 1 - 1) + 1
            }
            for m in kamari + 1...nnumber {
                 kekkaArray.append("\(m)日目 　\(kyozai) \(hnumber)〜\(hnumber + (knumber - 1))ページ")
                hnumber = hnumber + (knumber - 1) + 1
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
