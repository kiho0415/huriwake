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
    @IBOutlet var huriwakebutton: UIButton!
    @IBOutlet var clearbutton: UIButton!
    @IBOutlet var datebutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.kyozaiTextField.delegate = self
        self.hazimeTextField.delegate = self
        self.owariTextField.delegate = self
        

        //ボタンデザイン
        huriwakebutton.layer.cornerRadius = 20
        datebutton.layer.borderColor = UIColor.black.cgColor
        datebutton.layer.borderWidth = 1.0
        kyozaiTextField.layer.borderColor = UIColor.lightGray.cgColor
        hazimeTextField.layer.borderColor = UIColor.lightGray.cgColor
        owariTextField.layer.borderColor = UIColor.lightGray.cgColor
        clearbutton.layer.cornerRadius = 20
        
        //あらかじめ入力しておくテキスト
        self.kyozaiTextField.placeholder = "タップして入力";
        self.hazimeTextField.placeholder = "0";
        self.owariTextField.placeholder = "0";
                
    }
    //カレンダーから戻ってきたときに選択した日数を表示
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        nissuu = appDelegate.selectedDates.count
        
        if nissuu != 0{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd"
            let firstDateStr = dateFormatter.string(from: appDelegate.selectedDates.first!)
            let lastDateStr = dateFormatter.string(from: appDelegate.selectedDates.last!)
           
            nissuLabel.text = "\(firstDateStr)...\(lastDateStr)"
        }

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
        owari = owariTextField.text!
        kyozai = kyozaiTextField.text!
        
        if Int(hazime) == nil {
            let alert: UIAlertController = UIAlertController(title: "",message: "ページ数を入力してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }else if Int(owari) == nil {
            let alert: UIAlertController = UIAlertController(title: "",message: "数字を入力してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else if Int(hazime)! > Int(owari)! {
            let alert: UIAlertController = UIAlertController(title: "",message: "ページ数を正しく入力してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else if nissuu == 0 {
            let alert: UIAlertController = UIAlertController(title: "",message: "日付を選択してください。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else if Int(owari)! - Int(hazime)! + 1 < nissuu {
            let alert: UIAlertController = UIAlertController(title: "",message: "ページが少ないため、ふりわけできません。",preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: { action in
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
            
        }else{
            //画面遷移
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.hazime = hazime
            appDelegate.owari = owari
            appDelegate.subjectname = kyozai
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
        nissuLabel.text = ""
    }
    
}


