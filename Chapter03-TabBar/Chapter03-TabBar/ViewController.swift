//
//  ViewController.swift
//  Chapter03-TabBar
//
//  Created by LEE on 2023/02/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        
        title.text = "첫번째 탭"
        title.textColor = .red
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 14)
        
        title.sizeToFit()
        title.center.x = view.frame.width / 2
        
        view.addSubview(title)

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = tabBarController?.tabBar
//        tabBar?.isHidden = (tabBar!.isHidden) ? false : true

        UIView.animate(withDuration: TimeInterval(0.15)){
            tabBar?.alpha = ((tabBar?.alpha == 0) ? 1 : 0)
        }
    }


}

