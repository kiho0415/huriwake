//
//  MyTabBarController.swift
//  huriwake
//
//  Created by 森田貴帆 on 2018/03/10.
//  Copyright © 2018年 森田貴帆. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタマイズ
        
        // アイコンの色
        UITabBar.appearance().tintColor = UIColor.gray
        
        // 背景色
        UITabBar.appearance().barTintColor = UIColor.white
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
