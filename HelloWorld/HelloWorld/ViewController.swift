//
//  ViewController.swift
//  HelloWorld
//
//  Created by LEE on 2023/01/30.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sayHello(_ sender: UIButton) {
        self.uiTitle.text = "Hello, World!"
    }
    
}

