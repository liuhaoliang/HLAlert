//
//  HLAlert.swift
//  HLAlertDemo
//
//  Created by 刘豪亮 on 2018/4/16.
//  Copyright © 2018年 刘豪亮. All rights reserved.
//

import Foundation
import UIKit

public class HLAlert: NSObject {
    
    @objc public static let actionStyleDefault = "default";
    @objc public static let actionStyleCancel = "cancel";
    @objc public static let actionStyleDestructive = "destructive";
    
    @objc public static func showAlert(title: String?, message: String?,actionTitles : [String],handler: ((Int) -> Void)?){
        showAlert(title: title, message: message, actionTitles: actionTitles, actionStyles: nil, handler: handler);
    }
    
    @objc public static func showActionSheet(title: String?, message: String?,actionTitles : [String],handler: ((Int) -> Void)?){
        showActionSheet(title: title, message: message, actionTitles: actionTitles, actionStyles: nil, handler: handler);
    }
    
    @objc public static func showAlert(title: String?, message: String?,actionTitles : [String],actionStyles : [String]?,handler: ((Int) -> Void)?){
        show(title: title, message: message, preferredStyle: .alert, actionTitles: actionTitles, actionStyles: actionStyles, handler: handler);
    }
    
    @objc public static func showActionSheet(title: String?, message: String?,actionTitles : [String],actionStyles : [String]?,handler: ((Int) -> Void)?){
        show(title: title, message: message, preferredStyle: .actionSheet, actionTitles: actionTitles, actionStyles: actionStyles, handler: handler);
    }
    
    private static func show(title: String?, message: String?, preferredStyle: UIAlertControllerStyle,actionTitles : [String],actionStyles : [String]?,handler: ((Int) -> Void)?){
        let alertViewController = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle);
        for i in 0..<actionTitles.count {
            var alertActionStyle = UIAlertActionStyle.default;
            if let actionStyles = actionStyles,actionStyles.count>i{
                if actionStyles[i] == actionStyleCancel{
                    alertActionStyle = UIAlertActionStyle.cancel;
                }else if actionStyles[i] == actionStyleDestructive {
                    alertActionStyle = UIAlertActionStyle.destructive;
                }
            }
            let action = UIAlertAction.init(title: actionTitles[i], style: alertActionStyle, handler: { (a) in
                if let actionTitle = a.title,
                    let idx = actionTitles.index(of: actionTitle),
                    let handler = handler{
                    handler(idx);
                }
            })
            alertViewController.addAction(action);
        }
        topViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    static var topViewController: UIViewController? {
        var resultVC: UIViewController?
        resultVC = _topViewController(UIApplication.shared.keyWindow?.rootViewController)
        while let presentedViewController = resultVC?.presentedViewController {
            resultVC = _topViewController(presentedViewController)
        }
        return resultVC
    }
    
    private static func _topViewController(_ vc: UIViewController?) -> UIViewController? {
        if (vc is UINavigationController) {
            return _topViewController((vc as? UINavigationController)?.topViewController)
        } else if (vc is UITabBarController) {
            return _topViewController((vc as? UITabBarController)?.selectedViewController)
        } else {
            return vc
        }
    }
}

