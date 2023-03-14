//
//  EditViewController.swift
//  RealmPractice
//
//  Created by LEE on 2023/03/14.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    var primaryKey: ObjectId!
    
    
    @IBOutlet var wordTF: UITextField!
    @IBOutlet var meaningTF: UITextField!
    @IBOutlet var acceptBtn: UIButton!
    @IBOutlet var tagLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func touchUpAccept(_ sender: UIButton) {
        
        let realm = try! Realm()
        
        let word = Word()
        word.word = wordTF.text!
        word.meaning = meaningTF.text!
        
        let tag = Tag()
        tag.name = tagLabel.text!
        
        
        if sender.titleLabel?.text == "추가"{
            try! realm.write{
                realm.add(word)
                realm.add(tag)
            }
        }else{
            let update = realm.object(ofType: Word.self, forPrimaryKey: primaryKey)!
            
            try! realm.write{
                update.word = wordTF.text!
                update.meaning = meaningTF.text!
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
