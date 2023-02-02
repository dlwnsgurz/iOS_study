//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by LEE on 2023/02/02.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // let alert = UIAlertController(....)
        // present(alert, animated: ..)
    }


    @IBAction func alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel){ (_) in
            self.result.text = "취소 버튼 누름"
        }
        
        let ok = UIAlertAction(title: "확인", style: .default){ (_) in
            self.result.text = "확인 버튼 누름"
        }
        
        let exec = UIAlertAction(title: "실행", style: .destructive){ (_) in
            self.result.text = "실행 버튼 누름"
        }
        
        let stop = UIAlertAction(title: "중지", style: .default){ (_) in
            self.result.text = "중지 버튼 누름"
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addAction(exec)
        alert.addAction(stop)

        present(alert, animated: true)
        
        
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "Apple ID의 비밀번호를 입력하세요."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(_) in
            if let text = alert.textFields?[0]{
                print("입력된 값은 \(text.text!)")
            }else{
                print("입력된 값이 없습니다.")
            }
            
            
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.addTextField(){ (tf) in
            tf.placeholder = "암호 입력"
            tf.isSecureTextEntry = true
        }
        present(alert, animated: true)
        
    }
    
    
    @IBAction func auth(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "로그인", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(_) in
            let loginId = alert.textFields?[0]
            let loginPw = alert.textFields?[1]
            
            if loginId?.text == "A" && loginPw?.text == "B" {
                self.result.text = "로그인 성공"
            }else{
                self.result.text = "로그인 실패"
            }
        })
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addTextField(configurationHandler: {(id) in
            id.placeholder = "ID"
            id.isSecureTextEntry = false
        })
        
        alert.addTextField(configurationHandler: {(pw) in
            pw.placeholder = "PASSWORD"
            pw.isSecureTextEntry = true
        })
        
        present(alert, animated: true)
    }
    
}

