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


class CallenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var calendar:FSCalendar!
   // var nissuu: Int = 0
    var results: [Result] = []
    //TableViewの宣言
    @IBOutlet var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.swipeToChooseGesture.isEnabled = true
        calendar.allowsMultipleSelection = false
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self

        table.tableFooterView = UIView()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //とりだしたデータの中に選択した日付にデータがあるか調べて
        results = Result.loadAllOfDate(date: calendar.selectedDate ?? Date())
        //あったらTableViewに表示
        table.reloadData()
    }

    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //とりだしたデータの中に選択した日付にデータがあるか調べて
        results = Result.loadAllOfDate(date: date)
        //あったらTableViewに表示
        table.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let datelabel: UILabel = cell?.viewWithTag(1) as! UILabel
        let titlelabel: UILabel = cell?.viewWithTag(2) as! UILabel
        let pagelabel: UILabel = cell?.viewWithTag(3) as! UILabel
        
        let result = results[indexPath.row]
        titlelabel.text = result.subjectname
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        datelabel.text = dateFormatter.string(from: result.date)
        
        pagelabel.text = "\(result.startpage)〜\(result.endpage)ページ"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            results[indexPath.row].delete()
            results.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
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
