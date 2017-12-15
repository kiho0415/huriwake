//
//  karendaViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2017/12/08.
//  Copyright © 2017年 森田貴帆. All rights reserved.
//

import UIKit
//cocoapodの読み込み
import JBDatePicker


class karendaViewController: UIViewController,JBDatePickerViewDelegate {
    
    
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("date selected: \(dateFormatter.string(from: dayView.date!))")
    }
    
    @IBOutlet var datePicker: JBDatePickerView!
    
    lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.delegate = self //この行を追加
    
        func didSelectDay(_ dayView: JBDatePickerDayView) {
            print("date selected: \(dayView.date!)")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        datePicker.updateLayout()
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
