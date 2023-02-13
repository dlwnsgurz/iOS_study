//
//  CSLogButton.swift
//  MyMemory
//
//  Created by LEE on 2023/02/13.
//

import UIKit


public class CSLogButton: UIButton{
    
    var logType: CSLogType = .basic
    
    enum CSLogType: Int{
        case basic
        case title
        case tag
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = .white
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
        
    }
    
    @objc func logging(_ sender: UIButton){
        switch logType{
        case .tag:
            let tag = sender.tag
            NSLog("태그 값: \(tag) 버튼이 클릭되었습니다.")
        case .title:
            let title = sender.titleLabel?.text ?? "타이틀 없는"
            NSLog("\(title) 버튼이 클릭되었습니다.")
        case .basic:
            NSLog("버튼이 클릭되었습니다.")
        }
    }
}
