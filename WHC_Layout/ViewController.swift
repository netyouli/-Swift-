//
//  ViewController.swift
//  WHC_Layout
//
//  Created by WHC on 17/4/11.
//  Copyright © 2017年 WHC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let tableView = UITableView()
    fileprivate let contents = ["UILayoutGuide, safeAreaLayoutGuide示例",
                                "AutoLayout示例",
                                "UIStackView示例",
                                "自动计算cell高度示例",
                                "动态修改XIB约束"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "WHC_AutoLayoutKit"
        self.view.addSubview(tableView)
        
        // 使用WHC_AutoLayout 添加约束
        
        // 添加约束方式1
        //        tableView.whc_AutoSize(left: 0, top: 0, right: 0, bottom: 0)
        
        // 添加约束方式2
        tableView.whc_Left(0)
            .whc_Top(0)
            .whc_Right(0)
            .whc_Bottom(0)
        
        tableView.delegate =  self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "WHC_AutoLayout"
        let row = (indexPath as NSIndexPath).row
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = contents[row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: UIViewController!
        switch (indexPath as NSIndexPath).row {
        case 0:
            vc = LayoutGuideVC()
        case 1:// AutoLayout示例
            vc = AutoLayoutVC()
        case 2:// UIStackView示例
            vc = StackViewVC()
        case 3:// 自动计算cell高度示例
            vc = AutoCellHeightVC()
        case 4:// 修改xib约束
            vc = ModityXibVC(nibName: "ModityXibVC", bundle: nil)
        default:
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

