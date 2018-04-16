//
//  ViewController.swift
//  HLAlertDemo
//
//  Created by 刘豪亮 on 2018/4/16.
//  Copyright © 2018年 刘豪亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        HLAlert.showAlert(title: "这是title", message: "这是message", actionTitles: ["取消","确定"]) { (idx) in
//
//        }
        
        HLAlert.showActionSheet(title: "这是title", message: "这是message", actionTitles: ["操作一","操作二","取消"]) { (idx) in

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

