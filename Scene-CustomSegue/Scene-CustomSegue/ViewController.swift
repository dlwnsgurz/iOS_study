//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare 호출")
        if(segue.identifier == "action"){
            print("액션 세그 호출")
        }else if(segue.identifier == "custom"){
            print("커스텀 세그 호출")
        }
    }
}

