//
//  ViewController.swift
//  Bounds
//
//  Created by LEE on 2023/04/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    @IBOutlet var thirdView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        secondView.bounds.origin.x = 25
        secondView.bounds.origin.y = 25
        print("first View frame origin :\(firstView.frame.origin.x), \(firstView.frame.origin.y)")

        print("second View frame origin :\(secondView.frame.origin.x), \(secondView.frame.origin.y)")
        
        print("second View bounds origin :\(secondView.bounds.origin.x), \(secondView.bounds.origin.y)")
        
        print("third View frame origin :\(thirdView.frame.origin.x), \(thirdView.frame.origin.y)")
    }
    
    
    
}

