//
//  ViewController.swift
//  Chapter03-Alert
//
//  Created by LEE on 2023/02/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        
        defaultAlertBtn.center.x = view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        
        view.addSubview(defaultAlertBtn)
    }
    
    @objc func defaultAlert(_ sender: Any){
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        
        let v = UIViewController()
        v.view.backgroundColor = .red
        
        // KVO 패턴을 이용한 알림창 커스터마이징
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: false)
        
        
    }


}

