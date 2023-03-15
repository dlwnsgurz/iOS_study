//
//  ViewController.swift
//  RealmPractice
//
//  Created by LEE on 2023/03/14.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController{
    
    var wordList: Results<Word>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        wordList = realm.objects(Word.self)
                        
        tableView.rowHeight = 100
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try! Realm()
        wordList = realm.objects(Word.self)
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.wordLabel.text = wordList?[indexPath.row].word
        cell.meaningLabel.text = wordList?[indexPath.row].meaning
        
        if let tags = wordList?[indexPath.row].tags {
            
            var tagNames = ""
            
            for i in 0..<tags.count{
                tagNames += "\(tags[i].name)"
            }
            
            cell.tagLabel.text = tagNames
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = wordList?.count else { return 0 }
        
        return count
    }
    
    // MARK: - 셀 터치 시 단어 수정
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let editViewController = self.storyboard?.instantiateViewController(withIdentifier: "Edit") as! EditViewController
        
        editViewController.primaryKey = wordList?[indexPath.row]._id
        
        navigationController?.pushViewController(editViewController, animated: true)
        
    }

    // MARK: - 추가 버튼 터치 시
    @IBAction func touchUpAddBtn(_ sender: Any) {
        
        let addViewController = self.storyboard?.instantiateViewController(withIdentifier: "Add") as! AddViewController
        
        navigationController?.pushViewController(addViewController, animated: true)
        
    }
    

}

