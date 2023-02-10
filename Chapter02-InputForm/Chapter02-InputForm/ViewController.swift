//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by LEE on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "설정"
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        
        lblEmail.text = "이메일"
        lblEmail.font = .systemFont(ofSize: 14)
        
        view.addSubview(lblEmail)
        
        
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        
        lblUpdate.text = "자동갱신"
        lblUpdate.font = .systemFont(ofSize: 14)
        
        view.addSubview(lblUpdate)
        
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = .systemFont(ofSize: 14)
        
        view.addSubview(lblInterval)
        
        
        paramEmail = UITextField()
        paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        paramEmail.font = .systemFont(ofSize: 13)
        paramEmail.borderStyle = .roundedRect
        paramEmail.textAlignment = .right
        paramEmail.autocapitalizationType = .none

        view.addSubview(paramEmail)
    
        paramUpdate = UISwitch()
        paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        paramUpdate.setOn(true, animated: false)
        view.addSubview(paramUpdate)
        
        paramInterval = UIStepper()
        paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        paramInterval.maximumValue = 100
        paramInterval.minimumValue = 0
        paramInterval.value = 0
        paramInterval.stepValue = 1
        
        view.addSubview(paramInterval)
        
        txtUpdate = UILabel()
        txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        txtUpdate.font = .systemFont(ofSize: 12)
        txtUpdate.textColor = .red
        txtUpdate.text = "갱신함"
        
        view.addSubview(txtUpdate)
        
        txtInterval = UILabel()
        txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        txtInterval.font = .systemFont(ofSize: 12)
        txtInterval.textColor = .red
        txtInterval.text = "0분마다"
        
        view.addSubview(txtInterval)
        
        paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        
        paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_: )))
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    @objc func presentUpdateValue(_ sender: UISwitch){
        txtUpdate.text = (sender.isOn) ? "갱신함" : "갱신하지 않음"
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper){
        txtInterval.text = "\(Int(sender.value))분 마다"
    }
    
    @objc func submit(_ sender: UIBarButtonItem){
        let RVC = ReadViewController()
        RVC.pEmail = paramEmail.text
        RVC.pInterval = paramInterval.value
        RVC.pUpdate = paramUpdate.isOn
        navigationController?.pushViewController(RVC, animated: true)
    }

}


