//
//  CollectionViewCell.swift
//  CollectionView_Practice
//
//  Created by LEE on 2023/03/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    // MARK: - UIView Properties
    let label = UILabel()
    
    // MARK: - Identifier
    static let identifier = "cell"
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(label)
    }
    
    // MARK: - Layout Method
    override func layoutSubviews() {
        label.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 60)
    }
}
