//
//  CSButton.swift
//  Chapter03-CSButton
//
//  Created by LEE on 2023/02/11.
//

import UIKit



class CSButton: UIButton{
    
    var style = CSButtonType.rect{
        didSet{
            switch style{
            case .rect:
                backgroundColor = .black
                layer.borderColor = UIColor.gray.cgColor
                layer.borderWidth = 2
                layer.cornerRadius = 0
                setTitleColor(.white, for: .normal)
                setTitle("Rect Button", for: .normal)
            case .circle:
                backgroundColor = .red
                layer.borderColor = UIColor.blue.cgColor
                layer.borderWidth = 2
                layer.cornerRadius = 50
                setTitleColor(.white, for: .normal)
                setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("코드로 생성된 버튼", for: .normal)
        
    }
    
    init(){
        super.init(frame: CGRect.zero)
        
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type{
        case .rect:
            backgroundColor = .black
            layer.borderColor = UIColor.gray.cgColor
            layer.borderWidth = 2
            layer.cornerRadius = 0
            setTitleColor(.white, for: .normal)
            setTitle("Rect Button", for: .normal)
        case .circle:
            backgroundColor = .red
            layer.borderColor = UIColor.blue.cgColor
            layer.borderWidth = 2
            layer.cornerRadius = 50
            setTitleColor(.white, for: .normal)
            setTitle("Circle Button", for: .normal)
        }
        
        addTarget(self, action: #selector(count(_:)), for: .touchUpInside)
    }
    
    enum CSButtonType{
        case rect, circle
    }
    
    @objc func count(_ sender: UIButton){
        self.tag += 1
        self.setTitle("\(sender.tag)", for: .normal)
    }
}
