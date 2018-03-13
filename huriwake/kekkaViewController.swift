//
//  kekkaViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2017/08/20.
//  Copyright © 2017年 森田貴帆. All rights reserved.
//

import UIKit

class kekkaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var hazime: String = ""
    var owari: String = ""
    var kyozai: String = ""
    var kekkaText: String = ""
    
    var hnumber: Int = 0
    var onumber: Int = 0
    var nissuu: Int = 1
    var knumber: Int = 0
    var kamari: Int = 0
    
    var id: String = ""
    
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var kekkaArray: [Result] = []
    
    //StoryBoadで使うtableViewを宣言
    @IBOutlet var table:UITableView!
    @IBOutlet var deletebutton: UIButton!
    @IBOutlet var savebutton: UIButton!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンデザイン
        deletebutton.layer.cornerRadius = 20
        savebutton.layer.cornerRadius = 20

        hazime = appDelegate.hazime
        owari = appDelegate.owari
        nissuu = appDelegate.selectedDates.count
        kyozai = appDelegate.subjectname
        
        table.tableFooterView = UIView()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddhhmmss"
        id = dateFormatter.string(from: Date())
        
        
        table.dataSource = self
        table.delegate = self
        
        if Int(hazime) != nil {
            hnumber = Int(hazime)!
        }
        
        if Int(owari) != nil {
            onumber = Int(owari)!
        }
        
        knumber = ( onumber - hnumber + 1 ) / nissuu
        kamari = ( onumber - hnumber + 1 ) % nissuu
    
        
        //配列に結果を表示
        if kamari == 0 {
            for i in 1...nissuu {
               
                //保存
                let result = Result()
                result.id = id
                result.date = appDelegate.selectedDates[i-1]
                result.subjectname = kyozai
                result.startpage = hnumber
                result.endpage = hnumber + (knumber - 1)
                result.save()
                kekkaArray.append(result)
                hnumber = hnumber + (knumber - 1) + 1
            }
            
        }else{
            for k in 1...(nissuu-kamari) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd"
                dateFormatter.string(from: appDelegate.selectedDates[k-1])

                //保存
                let result = Result()
                result.id = id
                result.date = appDelegate.selectedDates[k-1]
                result.subjectname = kyozai
                result.startpage = hnumber
                result.endpage = hnumber + (knumber - 1)
                result.save()
                kekkaArray.append(result)

                hnumber = hnumber + (knumber  - 1) + 1
            }
            for m in (nissuu-kamari)+1...nissuu {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd"
                dateFormatter.string(from: appDelegate.selectedDates[m-1])
             
                //保存
                let result = Result()
                result.id = id
                result.date = appDelegate.selectedDates[m-1]
                result.subjectname = kyozai
                result.startpage = hnumber
                result.endpage = hnumber + (knumber - 1)
                result.save()
                kekkaArray.append(result)

                hnumber = hnumber + (knumber + 1 - 1) + 1
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
        let datelabel: UILabel = cell?.viewWithTag(1) as! UILabel
        let titlelabel: UILabel = cell?.viewWithTag(2) as! UILabel
        let pagelabel: UILabel = cell?.viewWithTag(3) as! UILabel
        
        titlelabel.text = kekkaArray[indexPath.row].subjectname
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        datelabel.text = dateFormatter.string(from: kekkaArray[indexPath.row].date)
        
        pagelabel.text = "\(kekkaArray[indexPath.row].startpage)ページ〜\(kekkaArray[indexPath.row].endpage)ページ"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    

    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func save() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func delete() {
        let alert: UIAlertController = UIAlertController(title: "",message: "削除しますか？",preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.default,
                handler: { action in
                    Result.deleteFromId(selectedId: self.id)
                    self.dismiss(animated: true, completion: nil)
                })
            )
            
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: UIAlertActionStyle.cancel,
                handler: { action in
                    

            })
        )
        present(alert, animated: true, completion: nil)
        
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
