//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 이 뷰 컨트롤러에 연결된 모든 세그웨이는 아래의 함수를 호출한다.
    // 시스템이 자동으로 호출한다. 호출 주체는 시스템.
    // 이 메소드는 UIViewController 클래스에 이미 정의되어 있다.
    // segue 인자는 호출한 세그웨이가 전달된다.
    // sender 인자에는 액션 세그의 경우, 버튼이나 레이블이 전달된다.
    // 메뉴얼 세그의 경우, 뷰 컨트롤러가 전달된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ""{
            
        }else if segue.identifier == "1"{
            
        }else{
            NSLog("Identifier : \(segue.identifier!)")
        }
    }
    
    

}

