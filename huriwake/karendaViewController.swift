//
//  karendaViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2017/12/08.
//  Copyright © 2017年 森田貴帆. All rights reserved.
//

import UIKit
//cocoapodの読み込み
import FSCalendar


class karendaViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var calendar:FSCalendar!
    var nissuu: Int = 0
    
    var saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calendar.delegate = self
        calendar.dataSource = self
        calendar.swipeToChooseGesture.isEnabled = true
        calendar.allowsMultipleSelection = true
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(calendar.selectedDates.count)
        nissuu = calendar.selectedDates.count
    }
    
    @IBAction func performSegueTofirst(_ sender:UIButton){
        //書き込み
        saveData.set(nissuu, forKey: "nissuu")
        
        dismiss(animated: true, completion: nil)
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
