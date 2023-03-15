//
//  AddViewController.swift
//  RealmPractice
//
//  Created by LEE on 2023/03/15.
//

import UIKit
import RealmSwift


class AddViewController: UIViewController {

    
    @IBOutlet var wordTF: UITextField!
    @IBOutlet var meaningTF: UITextField!
    @IBOutlet var tagTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpAddBtn(_ sender: Any) {
        
        let realm = try! Realm()
        
        let word = Word()
        word.word = wordTF.text!
        word.meaning = meaningTF.text!
        
        let tags = realm.objects(Tag.self).where{
            $0.name == tagTF.text!
        }
        
        if tags.count == 0{
            try! realm.write{
                let tag = Tag()
                tag.name = tagTF.text!
                tag.count = 1
                word.tags.append(tag)
                realm.add(word)
            }
        }else{
            try! realm.write{
                word.tags.append(tags.first!)
                realm.add(word)
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
