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
    @IBOutlet var tagField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        let word = realm.object(ofType: Word.self, forPrimaryKey: primaryKey)!
        wordTF.text = word.word
        meaningTF.text = word.meaning
        tagField.text = word.tags.first!.name
        
    }
    
    
    @IBAction func touchUpAccept(_ sender: UIButton) {
        
        let realm = try! Realm()

        let word = realm.object(ofType: Word.self, forPrimaryKey: primaryKey)!
        
        let tag = realm.objects(Tag.self).where{
            $0.name == tagField.text!
        }
        
        if tag.count == 0{
            try! realm.write{
                word.word = wordTF.text!
                word.meaning = meaningTF.text!
                word.editDate = Date()
                let newTag = Tag()
                newTag.name = tagField.text!
            }
        }else{
            try! realm.write{
                word.word = wordTF.text!
                word.meaning = meaningTF.text!
                word.editDate = Date()
            }
        }
        
        print("수정 완료")
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func touchUpDeleteBtn(_ sender: Any) {
        
        let realm = try! Realm()
        
        let word = realm.object(ofType: Word.self, forPrimaryKey: primaryKey)!
        
        try! realm.write{
            realm.delete(word)
        }
        
        print("삭제 완료")
        navigationController?.popViewController(animated: true)
    }
    
}
