//
//  ViewController.swift
//  Chapter03-CSButton
//
//  Created by LEE on 2023/02/11.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let csBtn = CSButton(type: .circle)
        csBtn.frame = CGRect(x: 30, y: 50, width: 150, height: 30)
        view.addSubview(csBtn)
        
        let csBtn2 = CSButton(type: .circle)
        csBtn2.frame = CGRect(x: 300, y: 50, width: 150, height: 30)
        view.addSubview(csBtn2)
    }


}

