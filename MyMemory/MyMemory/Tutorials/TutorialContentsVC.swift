//
//  TutorialContentsVC.swift
//  MyMemory
//
//  Created by LEE on 2023/02/16.
//

import UIKit

class TutorialContentsVC: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bgImage: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bgImage.contentMode = .scaleAspectFill
        self.titleLabel.text = titleText
        self.titleLabel.sizeToFit()
        
        self.bgImage.image = UIImage(named: imageFile)
        
        // Do any additional setup after loading the view.
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
