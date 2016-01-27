//
//  MainViewController.swift
//  learnSwift
//
//  Created by qufenqi on 16/1/25.
//  Copyright © 2016年 王正一. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.bringSubviewToFront(composeBtn)
    }
    /// 懒加载发布控件
    private lazy var composeBtn : UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")

}

// Mark: -设置界面
extension MainViewController{
    
    private func addChildViewControllers() {
        
        //设置渲染颜色为橙色
        tabBar.tintColor = UIColor.orangeColor()
        
        //设置所有子控制器
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")

        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        
        addChildViewController(ComposeViewController())
        
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")

        addChildViewController(ProfileTableViewController(), title: "我的", imageName: "tabbar_profile")
        //添加发表说说按钮
        addComposeBtn()
        
    }
    
    private func addChildViewController(vc: UIViewController, title: String, imageName: String) {
        
        vc.tabBarItem.image = UIImage(named: imageName)
        
        vc.title = title
        
        let nav = UINavigationController(rootViewController: vc)
        
        addChildViewController(nav)
        
    }
    
    private func addComposeBtn() {
        tabBar.addSubview(composeBtn)
        let count = childViewControllers.count
        let width = tabBar.bounds.width / CGFloat(count) - 1
        composeBtn.frame = CGRectInset(tabBar.bounds, 2 * width, 0)
    }
}