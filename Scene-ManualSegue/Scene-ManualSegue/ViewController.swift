//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by LEE on 2023/01/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func wind(_ sender: Any) {
        performSegue(withIdentifier: "ManualWind", sender: self)
    }
}

