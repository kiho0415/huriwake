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
    var nissuu: String = ""
    var kyozai: String = ""
    @IBOutlet var kyozaiTextField: UITextField!
    @IBOutlet var hazimeTextField: UITextField!
    @IBOutlet var hazimepLabel: UILabel!
    @IBOutlet var owariTextField: UITextField!
    @IBOutlet var owaripLabel: UILabel!
    @IBOutlet var nissuutitleLabel: UILabel!
    @IBOutlet var nissuuTextField: UITextField!
    @IBOutlet var nitikannLabel: UILabel!
    
    
    var saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.kyozaiTextField.delegate = self
        self.hazimeTextField.delegate = self
        self.owariTextField.delegate = self
        self.nissuuTextField.delegate = self
        
        self.kyozaiTextField.placeholder = "教材名を入力してください";
        
    }
    //キーボードが自動的に閉じるようにする
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func performSegueToResult(){
        hazime = hazimeTextField.text!
        print(hazime)
        owari = owariTextField.text!
        print(owari)
        nissuu = nissuuTextField.text!
        print(nissuu)
        kyozai = kyozaiTextField.text!
        print(kyozai)
        
        if Int(hazime) == nil {
            //alartを出す
            let alert: UIAlertController = UIAlertController(title: "警告",message: "数字を入力してください。",preferredStyle: .alert)
            //OKボタン
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //ボタンが押されたときの動作
                        print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }else if Int(owari) == nil {
            //alartを出す
            let alert: UIAlertController = UIAlertController(title: "警告",message: "数字を入力してください。",preferredStyle: .alert)
            //OKボタン
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //ボタンが押されたときの動作
                        print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else if Int(nissuu) == nil {
            //alartを出す
            let alert: UIAlertController = UIAlertController(title: "警告",message: "数字を入力してください。",preferredStyle: .alert)
            //OKボタン
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //ボタンが押されたときの動作
                        print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }else if Int(hazime)! > Int(owari)! {
            //alartを出す
            let alert: UIAlertController = UIAlertController(title: "警告",message: "ページ数を正しく入力してください。",preferredStyle: .alert)
            //OKボタン
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                        //ボタンが押されたときの動作
                        print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else{
            //書き込み
            saveData.set(kyozai, forKey: "kyozai")
            saveData.set(hazime, forKey: "hazime")
            saveData.set(owari, forKey: "owari")
            saveData.set(nissuu, forKey: "nissuu")
            //画面遷移
            performSegue(withIdentifier: "nyuuryoku", sender: nil)
        }
        
    }
    
    @IBAction func clear(){
        kyozai = ""
        hazime = ""
        owari = ""
        nissuu = ""
        kyozaiTextField.text = String(kyozai)
        hazimeTextField.text = String(hazime)
        owariTextField.text = String(owari)
        nissuuTextField.text = String(nissuu)
        
    }
    
}

