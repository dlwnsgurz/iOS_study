//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultIsUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    
    var paramEmail: String?
    var paramIsUpdate: Bool?
    var paramInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {

//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        if let email = ad?.paramEmail{
//            resultEmail.text = email
//        }
//
//        if let isUpdate = ad?.paramIsUpdate{
//            resultIsUpdate.text = isUpdate ? "갱신" : "갱신 안함"
//        }
//
//        if let interval = ad?.paramInterval{
//            resultInterval.text = "\(Int(interval))분 후 갱신"
//        }
        
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email"){
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultIsUpdate.text = update ? "갱신" : "갱신 안함"
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분 후 갱신"
    }

    
}

