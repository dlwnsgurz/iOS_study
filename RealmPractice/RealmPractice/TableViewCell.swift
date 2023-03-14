//
//  TableViewCell.swift
//  RealmPractice
//
//  Created by LEE on 2023/03/14.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
