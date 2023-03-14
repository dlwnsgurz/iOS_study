//
//  ViewController.swift
//  SubmitValue
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {

    // 이메일을 입력 받는 텍스트 필드.
    @IBOutlet var email: UITextField!
    
    // 갱신 주기를 설정하는 스테퍼.
    @IBOutlet var interval: UIStepper!
    
    // 자동 갱신 여부를 설정하는 스위치.
    @IBOutlet var isUpdate: UISwitch!
    
    // 자동 갱신 여부를 보여주는 레이블.
    @IBOutlet var isUpdateText: UILabel!
    
    // 갱신 주기를 보여주는 레이블.
    @IBOutlet var intervalText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isUpdateText.text = "갱신함"
        intervalText.text = "0분 마다"
        // Do any additional setup after loading the view.
    }

    // 자동 갱신 여부가 바뀔때마다 호출되는 메소드.
    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn{
            isUpdateText.text = "갱신함"
        }else{
            isUpdateText.text = "갱신하지 않음"
        }
    }
    
    // 갱신 주기를 설정할때마다 호출되는 메소드.
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        
        intervalText.text = "\(value)분 마다"
    }
    
    //
    @IBAction func onSubmit(_ sender: Any) {
        
        // 값을 전달받은 뷰 컨트롤러 인스턴스를 참조 후, 다운캐스팅.
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
    
    // 세그웨이 실행 전 전처리 메소드는 자동으로 호출된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rvc = segue.destination as! ResultViewController
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
    }
    
}

