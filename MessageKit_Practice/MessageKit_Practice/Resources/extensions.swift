//
//  extensions.swift
//  MessageKit_Practice
//
//  Created by LEE on 2023/08/03.
//

import Foundation
import UIKit

extension UIView{
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat{
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat{
        return self.frame.origin.y + self.frame.size.height
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat{
        return self.frame.origin.x + self.frame.size.width
    }
    
}

extension UITextField{
    
    func addLeftPadding(){
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 10, height: 0)
        
        self.leftView = view
        self.leftViewMode = .always
    }
}


