//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by LEE on 2023/02/01.
//

import UIKit


class ResultViewController: UIViewController{
    
    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultIsUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail = ""
    var paramUpdate = false
    var paramInterval = 0.0
    
    override func viewDidLoad() {
        resultEmail.text = paramEmail
        resultIsUpdate.text = paramUpdate ? "갱신함" : "갱신 안함"
        resultInterval.text = "\(Int(paramInterval))분 후 갱신"
    }
    
    @IBAction func onBack(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
}
