//
//  JFNavigationController.swift
//  BaoKanIOS
//
//  Created by jianfeng on 15/12/20.
//  Copyright © 2015年 六阿哥. All rights reserved.
//

import UIKit

class JFNavigationController: UINavigationController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        changeBarTintColor(NAVIGATIONBAR_RED_COLOR)
    }
    
    private func changeBarTintColor(color: UIColor)
    {
        let navBar = navigationBar
        navBar.barTintColor = color
        navBar.translucent = false
        navBar.barStyle = UIBarStyle.Black
        navBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navBar.shadowImage = UIImage()
        navBar.titleTextAttributes = [
            "NSForegroundColorAttributeName" : UIColor.blackColor(),
            "NSFontAttributeName" : UIFont.systemFontOfSize(22)
        ]
    }
    
    /**
     拦截push操作
     
     - parameter viewController: 即将压入栈的控制器
     - parameter animated:       是否动画
     */
    override func pushViewController(viewController: UIViewController, animated: Bool)
    {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            changeBarTintColor(NAVIGATIONBAR_WHITE_COLOR)
            UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        } else {
            viewController.hidesBottomBarWhenPushed = false
        }
        
        super.pushViewController(viewController, animated: animated)
        
        // 压入栈后创建返回按钮
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "top_navigation_back")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal),
            style: UIBarButtonItemStyle.Done,
            target: self,
            action: "back"
        )
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        
        changeBarTintColor(NAVIGATIONBAR_RED_COLOR)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        return super.popViewControllerAnimated(animated)
    }
    
    /**
     全局返回操作
     */
    @objc private func back()
    {
        popViewControllerAnimated(true)
    }
    
}
