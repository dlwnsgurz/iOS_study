//
//  ViewController.swift
//  SubmitValue
//
//  Created by LEE on 2024/01/15.
//

import UIKit

class ViewController: UIViewController {

    
    // 이메일 레이블
    @IBOutlet var emialLabel: UILabel!
    
    // 이메일 입력 텍스트
    @IBOutlet var emailText: UITextField!
    
    // 자동갱신 결과 레이블
    @IBOutlet var updateResultLabel: UILabel!
    // 자동갱신 레이블
    @IBOutlet var updateLabel: UILabel!
    // 자동갱신 스위치
    @IBOutlet var updateSwitch: UISwitch!
    
    // 갱신주기 결과 레이블
    @IBOutlet var intervalResultLabel: UILabel!
    // 갱신주기 레이블
    @IBOutlet var intervalLabel: UILabel!
    // 갱신주기 스테퍼
    @IBOutlet var intervalStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if updateSwitch.isOn{
            updateResultLabel.text = "자동갱신"
        }else{
            updateResultLabel.text = "자동갱신 안함"
        }
        
        intervalResultLabel.text = String(Int(intervalStepper.value)) + "분 마다"
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn{
            updateResultLabel.text = "자동갱신"
        }else{
            updateResultLabel.text = "안함"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
    
        intervalResultLabel.text = String(Int(sender.value)) + "분 마다"
    }
    
    @IBAction func onSubmit(_ sender: UIButton) {
        
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else{
            return
        }
        
        rvc.paramEmail = emailText.text!
        rvc.paramUpdate = updateSwitch.isOn
        rvc.paramInterval = intervalStepper.value
        
//        self.present(rvc, animated: true)
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func onPerfomSegue(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let rvc = segue.destination as? ResultViewController else{ return }
        
        rvc.paramEmail = emailText.text!
        rvc.paramUpdate = updateSwitch.isOn
        rvc.paramInterval = intervalStepper.value
    }
    
    
}

