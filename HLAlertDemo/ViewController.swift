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
        configUI();
    }
    
    @objc func alertAction(btn:UIButton) {
        let idx = btn.tag;
        if idx == 0 {
            HLAlert.showAlert(title: "alertTitle\(idx+1)", message: "这是message", actionTitles: ["取消","确定"]) { (idx) in
                
            }
        }else if idx == 1 {
            HLAlert.showAlert(title: "alertTitle\(idx+1)", message: "这是message", actionTitles: ["取消","删除"], actionStyles: [HLAlert.actionStyleDefault,HLAlert.actionStyleDestructive]) { (idx) in
                
            }
        }
    }
    
    @objc func sheetAction(btn:UIButton) {
        let idx = btn.tag;
        if idx == 0 {
            HLAlert.showActionSheet(title: "sheetTitle\(idx+1)", message: "这是message", actionTitles: ["Action1","Action2","cancel"]) { (idx) in
                
            }
        }else if idx == 1 {
            HLAlert.showActionSheet(title: "sheetTitle\(idx+1)", message: "这是message", actionTitles: ["Action1","delete","cancel"], actionStyles: [HLAlert.actionStyleDefault,HLAlert.actionStyleDestructive,HLAlert.actionStyleCancel]) { (idx) in
                
            }
        }
    }
    
    func configUI() {
        //AlertView UI
        let alertLabel = UILabel();
        alertLabel.text = "AlertView Sample";
        alertLabel.frame = CGRect.init(x: 0, y: 50, width: self.view.frame.size.width, height: 50);
        alertLabel.backgroundColor = UIColor.groupTableViewBackground;
        alertLabel.textColor = UIColor.black;
        self.view.addSubview(alertLabel);
        let alertTitles = ["alertView1","alertView2"];
        for i in 0..<alertTitles.count {
            let title = alertTitles[i];
            let btn = UIButton();
            btn.tag = i;
            btn.backgroundColor = UIColor.blue;
            btn.setTitleColor(UIColor.white, for: .normal);
            btn.addTarget(self, action: #selector(alertAction), for: .touchUpInside);
            btn.setTitle(title, for: .normal);
            btn.bounds = CGRect.init(x: 0, y: 0, width: 120, height: 50);
            btn.center = CGPoint.init(x: self.view.center.x, y: CGFloat(125+80*i));
            self.view.addSubview(btn);
        }
        
        //ActionSheet UI
        let sheetLabel = UILabel();
        sheetLabel.text = "ActionSheet Sample";
        sheetLabel.frame = CGRect.init(x: 0, y: 300, width: self.view.frame.size.width, height: 50);
        sheetLabel.backgroundColor = UIColor.groupTableViewBackground;
        sheetLabel.textColor = UIColor.black;
        self.view.addSubview(sheetLabel);
        
        let actionSheetTitles = ["actionSheet1","actionSheet2"];
        for i in 0..<actionSheetTitles.count {
            let title = actionSheetTitles[i];
            let btn = UIButton();
            btn.tag = i;
            btn.backgroundColor = UIColor.blue;
            btn.setTitleColor(UIColor.white, for: .normal);
            btn.addTarget(self, action: #selector(sheetAction), for: .touchUpInside);
            btn.setTitle(title, for: .normal);
            btn.bounds = CGRect.init(x: 0, y: 0, width: 120, height: 50);
            btn.center = CGPoint.init(x: self.view.center.x, y: CGFloat(375+80*i));
            self.view.addSubview(btn);
        }
    }
}

