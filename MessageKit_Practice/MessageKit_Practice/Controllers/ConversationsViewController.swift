//
//  ViewController.swift
//  MessageKit_Practice
//
//  Created by LEE on 2023/08/03.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 로그인 유무 변수
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        // 로그인이 안되어 있다면,
        if !isLoggedIn {
            
            let loginVC = LoginViewController()
            
            let navigationVC = UINavigationController(rootViewController: loginVC)
            navigationVC.modalPresentationStyle = .fullScreen
            
            present(navigationVC, animated: false)
            
        }
    }


}

