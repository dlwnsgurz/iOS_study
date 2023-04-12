//
//  Cell.swift
//  StackView_Practice
//
//  Created by LEE on 2023/04/12.
//

import UIKit
class Cell: UITableViewCell{
    
    static let identifier = "Cell"
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .leading
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let desLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(desLabel)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
