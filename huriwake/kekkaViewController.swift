//
//  kekkaViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2017/08/20.
//  Copyright © 2017年 森田貴帆. All rights reserved.
//

import UIKit

class kekkaViewController: UIViewController {
    
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
    
    
    //結果を表示させるためのラベル
    @IBOutlet var kekkaLabel: UILabel!
    @IBOutlet var itinitiniTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
        
        
        if kekkaamari == 0 {
            for i in 1...nissuunumber {
                kekkaText += String("\n\(i)日目 　\(hazimenumber)〜\(hazimenumber + (kekkanumber - 1))ページ")
                hazimenumber = hazimenumber + (kekkanumber - 1) + 1
            }
        }else{
            for k in 1...kekkaamari {
                kekkaText += String("\n\(k)日目 　\(hazimenumber)〜\(hazimenumber + (kekkanumber + 1 - 1))ページ")
                hazimenumber = hazimenumber + (kekkanumber + 1 - 1) + 1
            }
            for m in kekkaamari + 1...nissuunumber {
                 kekkaText += String("\n\(m)日目 　\(hazimenumber)〜\(hazimenumber + (kekkanumber - 1))ページ")
                hazimenumber = hazimenumber + (kekkanumber - 1) + 1
            }
        }
        
        itinitiniTextView.text = kekkaText
        
       
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
