//
//  Utils.swift
//  MyMemory
//
//  Created by LEE on 2023/02/16.
//

import Foundation

extension UIViewController{
    var tutorialSB: UIStoryboard{
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }
    
    func instantiateVC(identifier: String) -> UIViewController? {
        return tutorialSB.instantiateViewController(withIdentifier: identifier)
    }
}
