//
//  ViewController.swift
//  IBTest
//
//  Created by LEE on 2023/01/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func clickBtn01(_ sender: Any) {
        uiTitle01.text = "btn1 clicked"
    }
    @IBAction func clickBtn2(_ sender: Any) {
        uiTitle02.text = "btn2 clicked"
    }
    @IBAction func clickBtn3(_ sender: Any) {
        uiTitle03.text = "btn3 clicked"
    }
    @IBAction func clickBtn4(_ sender: Any){
        uiTitle04.text = "btn4 clicked"
    }
    @IBAction func clickBtn5(_ sender: Any) {
        uiTitle05.text = "btn5 clicked"
    } 
}

