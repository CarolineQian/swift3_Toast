//
//  ToastView.swift
//  FQCard
//
//  Created by 冯倩 on 2017/5/22.
//  Copyright © 2017年 冯倩. All rights reserved.
//

import UIKit

class ToastView: NSObject
{
    static var instance : ToastView = ToastView()
    
    var windows = UIApplication.shared.windows
    let windowLastView = UIApplication.shared.windows.last
    
    
    //清除所有弹窗
    func clear()
    {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        windows.removeAll(keepingCapacity: false)
    }

    
    //显示加载圈圈
    func showLoadingView()
    {
        clear()
        //添加window
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 78, height: 78))
        window.center = CGPoint(x: (windowLastView?.center.x)!, y: (windowLastView?.center.y)!)
        window.backgroundColor = UIColor.clear
        window.windowLevel = UIWindowLevelAlert
        window.isHidden = false
        windows.append(window)
        
        //添加view
        let loadingContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 78, height: 78))
        loadingContainerView.layer.cornerRadius = 12
        loadingContainerView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.8)
        window.addSubview(loadingContainerView)

        //添加UIActivityIndicatorView
        let loadingIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        loadingIndicatorView.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        loadingIndicatorView.center = CGPoint(x: loadingContainerView.center.x, y: loadingContainerView.center.y)
        loadingIndicatorView.startAnimating()
        loadingContainerView.addSubview(loadingIndicatorView)
        
        //3秒后消失
        perform(#selector(removeToast(sender: )), with: window, afterDelay: 3)
        
    }
    
    
    //弹窗文字
    func showToast(content:String , duration:CFTimeInterval)
    {
        clear()
    
        //添加windows
        let window = UIWindow()
        window.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        window.backgroundColor = UIColor.clear
        window.windowLevel = UIWindowLevelAlert
        window.isHidden = false
        windows.append(window)
        
        
        //添加label,显示提示语
        let toastContentView = UILabel(frame:CGRect(x: 0, y: 0, width: 150, height: 20))
        toastContentView.center = CGPoint(x: window.center.x, y: window.center.y)
        toastContentView.textColor = UIColor.white
        toastContentView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.7)
        toastContentView.font = UIFont.systemFont(ofSize: 13)
        toastContentView.numberOfLines = 0
        toastContentView.text = content
        toastContentView.textAlignment = NSTextAlignment.center
        toastContentView.clipsToBounds = true
        toastContentView.layer.cornerRadius = 7
        toastContentView.sizeToFit()
        toastContentView.width += 20
        toastContentView.height += 20
        window.addSubview(toastContentView)

        //动画效果及延时后调移除窗口方法
        toastContentView.layer.add(AnimationUtil.getToastAnimation(duration: duration), forKey: "animation")
        perform(#selector(removeToast(sender: )), with: window, afterDelay: duration)
    }
    
    //移除当前弹窗
    func removeToast(sender: AnyObject)
    {
        if let window = sender as? UIWindow
        {
            if let index = windows.index(where: { (item) -> Bool in
                return item == window
            })
            {
                 print("find the window and remove it at index \(index)")
                windows.remove(at: index)
            }
        }
        else
        {
             print("can not find the window")
        }
    }
    


}
