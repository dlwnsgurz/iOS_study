//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class FormViewController: UIViewController {

    
    @IBOutlet var email: UITextField!
    @IBOutlet var onSwitch: UISwitch!
    @IBOutlet var onStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        /// 단순한 값 전달
//        let preVC = self.presentingViewController
//        guard let uvc = preVC as? ViewController else { return }
//
//        uvc.paramIsUpdate = onSwitch.isOn
//        uvc.paramEmail = email.text
//        uvc.paramInterval = onStepper.value
//
//        self.presentingViewController?.dismiss(animated: true)
        
        /// AppDelegate를 이용한 값 전달
//        let ad = UIApplication.shared.delegate as? AppDelegate
//        ad?.paramInterval = onStepper.value
//        ad?.paramEmail = email.text
//        ad?.paramIsUpdate = onSwitch.isOn
        
        /// UserDefaults 객체를 이용한 값 전달
        let ud = UserDefaults.standard
        ud.set(email.text, forKey: "email")
        ud.set(onSwitch.isOn, forKey: "isUpdate")
        ud.set(onStepper.value, forKey: "interval")
        dismiss(animated: true)
    }


}
