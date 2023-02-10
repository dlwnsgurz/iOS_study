//
//  ViewController.swift
//  Chapter03-NavigationBar
//
//  Created by LEE on 2023/02/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.initTitleInput()
                    
    }

    func initTitle(){
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        nTitle.numberOfLines = 2
        nTitle.textAlignment = .center
        nTitle.font = .systemFont(ofSize: 15)
        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        nTitle.textColor = .white
        
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = color
        self.navigationItem.titleView = nTitle
    }
    
    func initNewTitle(){
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = .systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "58개 숙소"
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = .systemFont(ofSize: 12)
        subTitle.textColor = .white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationItem.titleView = containerView
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = color

    }
    
    func initTitleImage(){
        
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        
        navigationItem.titleView = imageV
    }
    
    func initTitleInput(){
        
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = .white
        tf.font = .systemFont(ofSize: 13)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .URL
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        navigationItem.titleView = tf
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow-back"), landscapeImagePhone: nil, style: .plain, target: self, action: nil)
        
        let rightContainerView = UIView()
        
        rightContainerView.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        let rItem = UIBarButtonItem(customView: rightContainerView)
        navigationItem.rightBarButtonItem = rItem

        let cnt = UILabel(frame: CGRect(x: 10, y: 8, width: 20, height: 20))
        cnt.font = .systemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        cnt.layer.borderWidth = 2
        cnt.layer.cornerRadius = 3
        cnt.layer.borderColor = cnt.textColor.cgColor
        
        rightContainerView.addSubview(cnt)
        
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 8, width: 20, height: 20)
        more.setImage(UIImage(named: "more"), for: .normal)

        rightContainerView.addSubview(more)
        
    }
}

