//
//  CSStepper.swift
//  Chapter03-CSStepper
//
//  Created by LEE on 2023/02/11.
//

import UIKit

@IBDesignable
public class CSStepper: UIControl{
    
    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    public var value: Int = 0{
        didSet{
            centerLabel.text = "\(value)"
            
            self.sendActions(for: .valueChanged)
        }
    }
    @IBInspectable
    public var stepValue: Int = 1{
        didSet{
            leftBtn.tag = stepValue
            rightBtn.tag = stepValue
        }
    }
    @IBInspectable
    public var leftTitle: String = "↓"{
        didSet{
            leftBtn.titleLabel?.text = leftTitle
        }
    }
    @IBInspectable
    public var rightTitle: String = "↑"{
        didSet{
            rightBtn.titleLabel?.text = rightTitle
        }
    }
    @IBInspectable
    public var labelColor: UIColor = .cyan{
        didSet{
            centerLabel.backgroundColor = labelColor
        }
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        let lblWidth = self.frame.width - 2 * btnWidth
        
        leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        
        rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
        
        centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
            
    }
    
    
    private func setup(){
        leftBtn.tag = -stepValue
        leftBtn.setTitle(leftTitle, for: .normal)
        leftBtn.titleLabel?.font = .systemFont(ofSize: 20)
        
        leftBtn.layer.borderColor = UIColor.blue.cgColor
        leftBtn.layer.borderWidth = 0.5
        
        rightBtn.tag = stepValue
        rightBtn.setTitle(rightTitle, for: .normal)
        rightBtn.titleLabel?.font = .systemFont(ofSize: 20)
        
        rightBtn.layer.borderColor = UIColor.blue.cgColor
        rightBtn.layer.borderWidth = 0.5
        
        centerLabel.text = String(value)
        centerLabel.font = .systemFont(ofSize: 16)
        centerLabel.textAlignment = .center
        centerLabel.backgroundColor = labelColor
        centerLabel.layer.borderWidth = 0.5
        centerLabel.layer.borderColor = UIColor.blue.cgColor
        
        self.addSubview(leftBtn)
        self.addSubview(centerLabel)
        self.addSubview(rightBtn)
        
        rightBtn.addTarget(self, action: #selector(changeValue(_:)), for: .touchUpInside)
        
        leftBtn.addTarget(self, action: #selector(changeValue(_:)), for: .touchUpInside)
        
    }
    
    @objc func changeValue(_ sender: UIButton){
        value += sender.tag
    }
}
