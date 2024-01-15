//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by LEE on 2024/01/10.
//

import UIKit
class NewSegue: UIStoryboardSegue{
    
    override func perform(){
        
        let startVC = self.source
        let destVC = self.destination
        
        UIView.transition(from: startVC.view, to: destVC.view, duration: 2,
                          options: .transitionCurlDown)

    }
}
