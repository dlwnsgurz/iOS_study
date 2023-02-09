//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by LEE on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.center = CGPoint(x: view.frame.width / 2, y: 100)
        btn.setTitle("테스트 버튼", for: .normal)
        
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
        
    }
    
    @objc func btnOnClick(_ sender: Any){
        if let btn = sender as? UIButton{
            btn.setTitle("클릭되었습니다.", for: .normal)
        }
    }


}

