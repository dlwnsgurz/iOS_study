//
//  ViewController.swift
//  Scene-Trans01
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

    
    @IBAction func moveNxt(_ sender: Any) {
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "secondVC")
        
        uvc.modalTransitionStyle = .coverVertical
        
        present(uvc, animated: true)
    }
    
}

