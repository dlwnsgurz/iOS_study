//
//  ListVC.swift
//  Chapter07-CoreData
//
//  Created by LEE on 2023/02/18.
//

import UIKit
import CoreData

class ListVC: UITableViewController {

    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    
    func fetch() -> [NSManagedObject]{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Board")
        
        let sorter = NSSortDescriptor(key: "regdate", ascending: false)
        
        fetchRequest.sortDescriptors = [sorter]
        
        let result = try! context.fetch(fetchRequest)
        
        return result
        
    }
    
    func save(title: String, contents: String) -> Bool{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let object = NSEntityDescription.insertNewObject(forEntityName: "Board", into: context)
        
        object.setValue(title, forKey: "title")
        object.setValue(contents, forKey: "contents")
        object.setValue(Date(), forKey: "regdate")
        
        let logObject = NSEntityDescription.insertNewObject(forEntityName: "Log", into: context) as! LogMO
        
        logObject.regdate = Date()
        logObject.type = LogType.create.rawValue
        
        (object as! BoardMO).addToLogs(logObject)
        
        do{
            try context.save()
            self.list.insert(object, at: 0)
            return true
        }catch{
            context.rollback()
            return false
        }
        
    }
    
    func delete(object: NSManagedObject) -> Bool{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(object)
        
        do{
            try context.save()
            return true
        }catch{
            context.rollback()
            return false
        }
        
    }
    
    func edit(object: NSManagedObject, title: String, contents: String) -> Bool{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        object.setValue(title, forKey: "title")
        object.setValue(contents, forKey: "contents")
        object.setValue(Date(), forKey: "regdate")
        
        let logObject = NSEntityDescription.insertNewObject(forEntityName: "Log", into: context) as! LogMO
        
        logObject.regdate = Date()
        logObject.type = LogType.edit.rawValue
        
        logObject.board = (object as! BoardMO)
        
        
        do{
            try context.save()
            self.list = self.fetch()
            return true
        }catch{
            context.rollback()
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let addBtn = UIBarButtonItem(systemItem: .add)
        addBtn.target = self
        addBtn.action = #selector(add(_:))
        self.navigationItem.rightBarButtonItem = addBtn
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let record = self.list[indexPath.row]
        let title = record.value(forKey: "title") as? String
        let contents = record.value(forKey: "contents") as? String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = contents
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let object = self.list[indexPath.row]
        
        if self.delete(object: object){
            self.list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = self.list[indexPath.row]
        
        let title = object.value(forKey: "title") as? String
        let contents = object.value(forKey: "contents") as? String
        
        let alert = UIAlertController(title: "게시글 수정", message: nil, preferredStyle: .alert)
        
        alert.addTextField(){ $0.text = title }
        alert.addTextField(){ $0.text = contents }
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "수정", style: .default){
            (_) in
            guard let title = alert.textFields?[0].text, let contents = alert.textFields?[1].text else {
                return
            }
            
            if self.edit(object: object, title: title, contents: contents){
                let cell = self.tableView.cellForRow(at: indexPath)
                cell?.textLabel?.text = title
                cell?.detailTextLabel?.text = contents
                
                let firstIndexPath = IndexPath(row: 0, section: 0)
                tableView.moveRow(at: indexPath, to: firstIndexPath)
            }
            
        })
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let object = self.list[indexPath.row] as! BoardMO
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogVC") as? LogVC else {
            return
        }
        
        vc.board = object
        self.show(vc, sender: self)
        
    }
    
    @objc func add(_ sender: UIBarButtonItem){
        
        let alert = UIAlertController(title: "게시글 등록", message: nil, preferredStyle: .alert)
        
        alert.addTextField{
            $0.placeholder = "제목"
        }
        
        alert.addTextField{
            $0.placeholder = "내용"
        }
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default){
            (_) in
            
            guard let title = alert.textFields?.first?.text, let contents = alert.textFields?.last?.text else{
                return
            }

            if self.save(title: title, contents: contents) == true{
                self.tableView.reloadData()
            }
            
            
        })
        self.present(alert, animated: false)
    }
    
}
