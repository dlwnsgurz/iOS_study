//
//  SecondViewController.swift
//  Scene-MultiUnwind
//
//  Created by LEE on 2023/02/01.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToPage2(_ sender: UIStoryboardSegue){
        
        // 현재 뷰 컨트롤러로 이동.
        // 하위 뷰 컨트롤러의 인스턴스가 모두 해제됨.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
