//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by LEE on 2023/01/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveByNavi(_ sender: Any) {
        
        // 이동할 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") else { return }
        
        // 네비게이션 컨트롤러를 이용한 화면 전환.
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        
        // 이동할 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") else { return }
        
        // 프레젠테이션 방식으로 화면 전환.
        self.present(uvc, animated: true)
    }
}

