//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by LEE on 2024/01/15.
//

import UIKit

class ResultViewController: UIViewController{
    
    // 이메일 레이블
    @IBOutlet var emailLabel: UILabel!
    // 갱신 레이블
    @IBOutlet var updateLabel: UILabel!
    // 갱신주기 레이블
    @IBOutlet var intervalLabel: UILabel!
    
    
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        emailLabel.text = paramEmail
        updateLabel.text = paramUpdate ? "갱신함" : "갱신안함"
        intervalLabel.text = String(Int(paramInterval)) + "분 마다 갱신함"
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
}
