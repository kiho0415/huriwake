//
//  ViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2017/08/20.
//  Copyright © 2017年 森田貴帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    var hazime: String = ""
    var owari: String = ""
    var nissuu: Int = 0
    var kyozai: String = ""
    @IBOutlet var kyozaiTextField: UITextField!
    @IBOutlet var hazimeTextField: UITextField!
    @IBOutlet var hazimepLabel: UILabel!
    @IBOutlet var owariTextField: UITextField!
    @IBOutlet var owaripLabel: UILabel!
    @IBOutlet var nissuLabel: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.kyozaiTextField.delegate = self
        self.hazimeTextField.delegate = self
        self.owariTextField.delegate = self
      
        
        //あらかじめ入力しておくテキスト
        self.kyozaiTextField.placeholder = "タップして教材名を入力";
        self.hazimeTextField.placeholder = "tap"; //⇦変える
        self.owariTextField.placeholder = "tap"; //⇦変える
        
    }
    //カレンダーから戻ってきたときに選択した日数を表示
    override func viewWillAppear(_ animated: Bool) {
        //ここで日数を取り出してた
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        nissuu = appDelegate.selectedDates.count

    }
    //キーボードが自動的に閉じるようにする
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func performSegueToResult(){
        hazime = hazimeTextField.text!
        //print(hazime)
        owari = owariTextField.text!
        //print(owari)
        kyozai = kyozaiTextField.text!
        //print(kyozai)
        
        if Int(hazime) == nil {
            let alert: UIAlertController = UIAlertController(title: "警告",message: "数字を入力してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }else if Int(owari) == nil {
            let alert: UIAlertController = UIAlertController(title: "警告",message: "数字を入力してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else if Int(hazime)! > Int(owari)! {
            let alert: UIAlertController = UIAlertController(title: "警告",message: "ページ数を正しく入力してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else if nissuu == 0 {
            let alert: UIAlertController = UIAlertController(title: "警告",message: "日付を選択してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
           
            
        }else{
            //画面遷移
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.hazime = hazime
            appDelegate.owari = owari
            performSegue(withIdentifier: "nyuuryoku", sender: nil)
        }
        
    }
    
    @IBAction func clear(){
        kyozai = ""
        hazime = ""
        owari = ""
        nissuu = 0
        kyozaiTextField.text = String(kyozai)
        hazimeTextField.text = String(hazime)
        owariTextField.text = String(owari)
        nissuLabel.text = "0日間選択中"
    }
    
}


