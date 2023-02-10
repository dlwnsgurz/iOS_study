//
//  ReadViewController.swift
//  Chapter02-InputForm
//
//  Created by LEE on 2023/02/09.
//

import UIKit

class ReadViewController: UIViewController {

    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let email = UILabel()
        let update = UILabel()
        let interval = UILabel()
        
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        update.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        interval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        email.text = "전달받은 이메일 : \(pEmail! )"
        update.text = "업데이트 여부 : \(pUpdate! )"
        interval.text = "갱신 주기 : \(Int(pInterval!))분 마다"
        
        view.addSubview(email)
        view.addSubview(update)
        view.addSubview(interval)
        
        // Do any additional setup after loading the view.
    }
    

}
