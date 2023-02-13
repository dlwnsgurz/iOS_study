//
//  FrontViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by LEE on 2023/02/13.
//

import UIKit

class FrontViewController: UIViewController {

    var delegate: RevealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let barSideButton = UIBarButtonItem(image: UIImage(named: "sidemenu"), style: .plain, target: self, action: #selector(moveSide))
        
        navigationItem.leftBarButtonItem = barSideButton
        
        let dragLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        
        dragLeft.direction = .right
        self.view.addGestureRecognizer(dragLeft)
        
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragRight.direction = .left
        self.view.addGestureRecognizer(dragRight)
    }
    
    @objc func moveSide(_ sender: Any){
        if delegate?.isSideBarShowing == true{
            delegate?.closeSideBar(nil)
        }else{
            delegate?.openSideBar(nil)
        }
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
