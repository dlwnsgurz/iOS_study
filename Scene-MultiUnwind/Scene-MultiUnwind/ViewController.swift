//
//  ViewController.swift
//  Scene-MultiUnwind
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func goToPage1(_ sender: UIStoryboardSegue){
        // 현재 뷰 컨트롤러로 이동.
        // 하위 뷰 컨트롤러의 인스턴스가 모두 해제됨.
    }

}

