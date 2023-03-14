//
//  RevealViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by LEE on 2023/02/13.
//

import UIKit

class RevealViewController: UIViewController {

    
    var contentVC: UIViewController?
    var sideVC: UIViewController?
    
    var isSideBarShowing = false
    
    let SLIDE_TIME = 0.3
    let SIDEBAR_WIDTH: CGFloat = 260
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView(){
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController{
            
            self.contentVC = vc
            self.addChild(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParent: self)
            
            let frontVC = vc.viewControllers[0] as? FrontViewController
            frontVC?.delegate = self
        }
        
        
    }

    func getSideView(){
        
        if sideVC == nil {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear"){
                
                self.sideVC = vc
                
                self.addChild(vc)
                self.view.addSubview(vc.view)
                vc.didMove(toParent: self)
                
                self.view.bringSubviewToFront((contentVC?.view)!)
            }
        }
        
    }
    
    func setShadowEffect(shadow: Bool, offset: CGFloat){
        
        if shadow == true {
            self.contentVC?.view.layer.cornerRadius = 10
            self.contentVC?.view.layer.shadowOpacity = 0.8
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset)
        }else{
            self.contentVC?.view.layer.cornerRadius = 0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    func openSideBar(_ complete: (() -> Void)? ){
        
        getSideView()
        setShadowEffect(shadow: true, offset: -2)
        
        let options = UIView.AnimationOptions([.curveEaseOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(SLIDE_TIME), delay: TimeInterval(0), options: options, animations: {
            self.contentVC?.view.frame = CGRect(x: self.SIDEBAR_WIDTH, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: {
            if $0 == true{
                self.isSideBarShowing = true
                complete?()
            }
        })
    }
    
    
    func closeSideBar(_ complete: (() -> Void)? ){
        
        let options = UIView.AnimationOptions([.curveEaseOut, .beginFromCurrentState])
        
        UIView.animate(
            withDuration: TimeInterval(SLIDE_TIME),
            delay: TimeInterval(0),
            options: options,
            animations:{
                self.contentVC?.view.frame =
                CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)}
            ,
            completion: {
            if $0 == true{
                self.isSideBarShowing = false
                complete?()
            }
        })
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
