//
//  ViewController.swift
//  addCardDemo
//
//  Created by 冯倩 on 2017/6/30.
//  Copyright © 2017年 冯倩. All rights reserved.
//

import UIKit

class ViewController: UITableViewController
{
    //控制本页面tableView样式
    var isType:Bool = true
    //
    var dataMutableArray : NSMutableArray = []
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationUI()
        tableViewUI()
        
        
    }

    
    //MARK: - UI
    private func tableViewUI()
    {
        tableView = UITableView(frame: CGRect(x:0,y:0,width:ScreenWidth,height:ScreenHeight), style: UITableViewStyle.grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    private func navigationUI()
    {
        navigationController?.navigationBar.tintColor = UIColor.hexStringToColor(hexString: ColorOfBlueColor)
        //右侧编辑和添加按钮
        let item1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addMemberCardButtonAction))
        let item2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(editMemberCardButtonAction))
        navigationItem.rightBarButtonItems=[item1,item2]
    }
    
    //MARK: - Actions
    func addMemberCardButtonAction()
    {

        ToastView.instance.showToast(content:"输入不全,请重新输入吧啦啦啦啦啦啦啦", duration: 2)
    }
    
    func editMemberCardButtonAction()
    {
         ToastView.instance.showLoadingView()
    }
    

}

