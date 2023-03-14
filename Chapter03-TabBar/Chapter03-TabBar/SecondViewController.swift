//
//  SecondViewController.swift
//  Chapter03-TabBar
//
//  Created by LEE on 2023/02/10.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        
        title.text = "두번째 탭"
        title.textColor = .red
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 14)
        
        title.sizeToFit()
        title.center.x = view.frame.width / 2
        
        view.addSubview(title)
        // Do any additional setup after loading the view.
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
