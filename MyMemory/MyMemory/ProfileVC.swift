//
//  ProfileVC.swift
//  MyMemory
//
//  Created by LEE on 2023/02/14.
//

import UIKit
class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let profileImage = UIImageView()
    let tv = UITableView()
    let uInfo = UserInfoManager()
    
    override func viewDidLoad() {
        navigationItem.title = "프로필"
        
        let backBtn = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close(_:)))
        navigationItem.leftBarButtonItem = backBtn
        
        let image = uInfo.profile
        profileImage.image = image
        profileImage.frame.size = CGSize(width: 100, height: 100)
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderWidth = 0
        profileImage.layer.masksToBounds = true
        profileImage.center = CGPoint(x: view.frame.width / 2, y: 130)
        
        self.view.addSubview(profileImage)
        
        self.tv.frame = CGRect(x: 0, y: self.profileImage.frame.origin.y + profileImage.frame.height + 20, width: view.frame.width, height: 100)
        self.tv.delegate = self
        self.tv.dataSource = self
        
        self.view.addSubview(tv)
        
        let bg = UIImage(named: "profile-bg")
        let bgImg = UIImageView(image: bg)
        bgImg.frame.size = CGSize(width: bgImg.frame.size.width, height: bgImg.frame.size.height)
        bgImg.center = CGPoint(x: view.frame.width / 2, y: 40)
        
        bgImg.layer.cornerRadius = bgImg.frame.size.width / 2
        bgImg.layer.borderWidth = 0
        bgImg.layer.masksToBounds = true
        view.addSubview(bgImg)
        view.bringSubviewToFront(tv)
        view.bringSubviewToFront(profileImage)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.detailTextLabel?.font = .systemFont(ofSize: 13)
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row{
            case 0 :
                cell.textLabel?.text = "이름"
                cell.detailTextLabel?.text = uInfo.name ?? "Login please"
            case 1 :
                cell.textLabel?.text = "계정"
                cell.detailTextLabel?.text = uInfo.account ?? "Login please"
            default:
                break

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.uInfo.isLogin == false{
            self.doLogin(self.tv)
        }
        
    }
    
    @objc func close(_ sender: Any){
        self.presentingViewController?.dismiss(animated: true)
        
    }
    
    @objc func doLogin(_ sender: Any){
        let loginAlert = UIAlertController(title: "LOGIN", message: nil, preferredStyle: .alert)
        
        loginAlert.addTextField{
            $0.placeholder = "Your Account"
        }
        
        loginAlert.addTextField{
            $0.placeholder = "PassWord"
            $0.isSecureTextEntry = true
        }
        
        loginAlert.addAction(UIAlertAction(title: "취소", style: .cancel))
        loginAlert.addAction(UIAlertAction(title: "로그인", style: .destructive){
            (_) in
            let account = loginAlert.textFields?[0].text ?? ""
            let passwd = loginAlert.textFields?[1].text ?? ""
            
            if self.uInfo.login(account: account, passwd: passwd){
                self.tv.reloadData()
                self.profileImage.image = self.uInfo.profile
                
            }else{
                let msg = "로그인에 실패했습니다."
                let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                self.present(alert,animated: true)
            }
        })
        present(loginAlert, animated: true)
    }
    
    @objc func doLogout(_ sender: Any){
        let msg = "로그아웃 하시겠습니까?"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default){
            (_) in
            if self.uInfo.logount(){
                
            }
        })
        present(alert, animated: true)
    }
    
}
