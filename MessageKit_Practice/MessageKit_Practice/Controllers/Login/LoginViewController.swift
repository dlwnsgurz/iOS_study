//
//  LoginViewController.swift
//  MessageKit_Practice
//
//  Created by LEE on 2023/08/03.
//

import UIKit

class LoginViewController: UIViewController {

    private let scrollView: UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    private let emailField: UITextField = {
       
        let textField = UITextField()
        textField.placeholder = "Email Address..."
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.returnKeyType = .continue
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addLeftPadding()
        textField.backgroundColor = .white
        return textField
    }()
    
    
    private let passwordField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Password..."
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.returnKeyType = .done
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addLeftPadding()
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private let loginButton: UIButton = {
       
        let button = UIButton()
    
        button.backgroundColor = .link
        
        button.layer.cornerRadius = 12
        
        button.setAttributedTitle(.init(string: "Log In",
                                attributes: [.font : UIFont.boldSystemFont(ofSize: 20), .foregroundColor : UIColor.white]), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LogIn"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = .init(title: "Register",
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(didTapRegister))
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = scrollView.width / 4
    
        imageView.frame = CGRect(x: (scrollView.width - size) / 2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        emailField.frame = CGRect(x: 30,
                                  y: imageView.bottom + 20,
                                  width: scrollView.width - 60,
                                  height: 52)
        
        passwordField.frame = CGRect(x: 30,
                                     y: emailField.bottom + 10,
                                     width: emailField.width,
                                     height: 52)
        
        loginButton.frame = CGRect(x: 30,
                                     y: passwordField.bottom + 10,
                                     width: emailField.width,
                                     height: 52)
    }
    
    
    @objc private func loginButtonTapped() {
        
        // 키보드를 내리기 위해
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                
            alertUserError()
            return
            
        }

        // MARK: - Firebase Log In
        
        
        

    }
    
    func alertUserError() {
        let alert = UIAlertController(title: "Woops",
                                      message: "Please Enter all Information For Log In",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: false)
        
    }
    
    
    @objc private func didTapRegister() {

        let registerVC = RegisterViewController()
        registerVC.title = "Create Account"
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }else{
            loginButtonTapped()
        }
        
        return true
    }
}
