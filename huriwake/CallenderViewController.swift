//
//  CallenderViewController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2018/01/25.
//  Copyright © 2018年 森田貴帆. All rights reserved.
//

import UIKit
//cocoapodの読み込み
import FSCalendar


class CallenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource,UITableViewDataSource{

    @IBOutlet var calendar:FSCalendar!
    var nissuu: Int = 0
    var results: [Result] = []
    //TableViewの宣言
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.swipeToChooseGesture.isEnabled = true
        calendar.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
        table.dataSource = self
        
        results = Result.loadAll()
        print(results)
        
        
    }

    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //とりだしたデータの中に選択した日付にデータがあるか調べて
        //あったらTableViewに表示
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //テストと表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
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
