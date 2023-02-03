//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by LEE on 2023/02/03.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var tf: UITextField!
    @IBOutlet var onSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tf.placeholder = "값을 입력하세요."
        tf.keyboardType = .alphabet
        tf.keyboardAppearance = .dark
        tf.returnKeyType = .join
        tf.enablesReturnKeyAutomatically = true
        
        tf.borderStyle = .line
        tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        tf.contentVerticalAlignment = .center
        tf.contentHorizontalAlignment = .center
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.borderWidth = 2.0
        tf.becomeFirstResponder()
        
        tf.delegate = self
        
    }

    @IBAction func confirm(_ sender: Any) {
        tf.resignFirstResponder()
        
    }
    
    @IBAction func input(_ sender: Any) {
        tf.becomeFirstResponder()
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다.")
        
        if onSwitch.isOn{
            print("텍스트 필드의 편집이 허용되어있습니다.")
            return true
        }else{
            print("텍스트 필드의 편집이 허용되어있지 않습니다. 입력이 불가능합니다.")
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작되었습니다.")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("텍스트 필드의 내용이 \(string)으로 변경되었습니다.")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("엔터 키가 눌렸습니다.")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
}

