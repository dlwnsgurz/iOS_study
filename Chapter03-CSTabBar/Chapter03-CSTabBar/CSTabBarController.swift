//
//  ViewController.swift
//  Chapter03-CSTabBar
//
//  Created by LEE on 2023/02/11.
//

import UIKit

class CSTabBarController: UITabBarController {

    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBar.isHidden = true
        tabItem01.isSelected = true 
        let width = view.frame.width
        let height: CGFloat = 60
        
        let x: CGFloat = 0
        let y = view.frame.height - height
        
        csView.frame = CGRect(x: x, y: y, width: width, height: height)
        csView.backgroundColor = .brown
        
        view.addSubview(csView)
        
        
        let tabItemWidth = width / 3
        let tabItemHeight = height
        
        tabItem01.frame = CGRect(x: 0, y: 0, width: tabItemWidth, height: tabItemHeight)
        
        tabItem02.frame = CGRect(x: tabItemWidth, y: 0, width: tabItemWidth, height: tabItemHeight)
        
        tabItem03.frame = CGRect(x: tabItemWidth*2, y: 0, width: tabItemWidth, height: tabItemHeight)
        
        csView.addSubview(tabItem01)
        csView.addSubview(tabItem02)
        csView.addSubview(tabItem03)
        
        addTabBarBtn(btn: tabItem01, title: "button01", tag: 1)
        addTabBarBtn(btn: tabItem02, title: "button02", tag: 2)
        addTabBarBtn(btn: tabItem03, title: "button03", tag: 3)
    }
    
    func addTabBarBtn(btn: UIButton, title: String, tag: Int){
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.yellow, for: .selected)
        btn.addTarget(self, action: #selector(tabBarItemClick(_:)), for: .touchUpInside)
    }

    @objc func tabBarItemClick(_ sender: UIButton){
        tabItem03.isSelected = false
        tabItem01.isSelected = false
        tabItem02.isSelected = false
        
        sender.isSelected = true
        
        selectedIndex = sender.tag - 1
    }
}


