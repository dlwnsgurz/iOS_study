//
//  RegisterViewController.swift
//  MessageKit_Practice
//
//  Created by LEE on 2023/08/03.
//

import UIKit

class RegisterViewController: UIViewController, UINavigationControllerDelegate {

    private let scrollView: UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
        
    }()
    
    private let firstNameField: UITextField = {
       
        let textField = UITextField()
        textField.placeholder = "First Name..."
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
    
    private let lastNameField: UITextField = {
       
        let textField = UITextField()
        textField.placeholder = "Last Name..."
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
    
    private let registerButton: UIButton = {
       
        let button = UIButton()
    
        button.backgroundColor = .systemGreen
        
        button.layer.cornerRadius = 12
        
        button.setAttributedTitle(.init(string: "Register",
                                attributes: [.font : UIFont.boldSystemFont(ofSize: 20), .foregroundColor : UIColor.white]), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LogIn"
        view.backgroundColor = .white
        
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        
        
        imageView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePicture))
        
        imageView.addGestureRecognizer(gesture)

    }
    
    @objc private func didTapChangeProfilePicture(){
        
        presentPhotoActionSheet()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = scrollView.width / 4
    
        imageView.frame = CGRect(x: (scrollView.width - size) / 2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        firstNameField.frame = CGRect(x: 30,
                                  y: imageView.bottom + 20,
                                  width: scrollView.width - 60,
                                  height: 52)
        lastNameField.frame = CGRect(x: 30,
                                  y: firstNameField.bottom + 10,
                                  width: scrollView.width - 60,
                                  height: 52)
        
        emailField.frame = CGRect(x: 30,
                                  y: lastNameField.bottom + 10,
                                  width: scrollView.width - 60,
                                  height: 52)
        
        passwordField.frame = CGRect(x: 30,
                                     y: emailField.bottom + 10,
                                     width: emailField.width,
                                     height: 52)
        
        registerButton.frame = CGRect(x: 30,
                                     y: passwordField.bottom + 10,
                                     width: emailField.width,
                                     height: 52)
    }
    
    
    @objc private func registerButtonTapped() {
        
        // 키보드를 내리기 위해
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !firstName.isEmpty, !lastName.isEmpty,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                
            alertUserError()
            return
            
        }

        // MARK: - Firebase Log In
        
        
        
    }
    
    func alertUserError() {
        let alert = UIAlertController(title: "Woops",
                                      message: "Please Enter all Information For Create a New Account.",
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

extension RegisterViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }else{
            registerButtonTapped()
        }
        
        return true
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate{
    
    func presentPhotoActionSheet(){
        let alert = UIAlertController(title: "Profile Picture", message: "How would you like to select photo", preferredStyle: .actionSheet)
        
        let firstAction = UIAlertAction(title: "take a photo", style: .default, handler: { (_) in
                self.presentCamera()
            }
        )
        let secondAction = UIAlertAction(title: "select a photo", style: .default,
            handler: { (_) in
                self.presentAlbum()
            }
        )
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)

    }
    
    func presentCamera(){
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .camera
        imagePickerVC.allowsEditing = true
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: false)
    }
    
    func presentAlbum(){
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.allowsEditing = true
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        let selectedPhoto = info[.editedImage] as? UIImage
        
        self.imageView.image = selectedPhoto
        
    }
}
