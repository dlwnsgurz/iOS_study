//
//  ViewController.swift
//  SubmitValue
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdate: UISwitch!
    
    
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isUpdateText.text = "갱신함"
        intervalText.text = "0분 마다"
        // Do any additional setup after loading the view.
    }


    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn{
            isUpdateText.text = "갱신함"
        }else{
            isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        
        intervalText.text = "\(value)분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else{
            return
        }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    
    @IBAction func onPerfomSegue(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ManualSegue", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rvc = segue.destination as! ResultViewController
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
    }
    
}

