//
//  MemoDAO.swift
//  MyMemory
//
//  Created by LEE on 2023/02/19.
//

import UIKit
import CoreData

class MemoDAO{
    
    lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }()
    
    func fetch(keyword text: String? = nil) -> [MemoData]{
        var memoList = [MemoData]()
        
        let fetchRequest = MemoMO.fetchRequest()
        
        let regSorter = NSSortDescriptor(key: "regdate", ascending: false)
        fetchRequest.sortDescriptors = [regSorter]
        
        if let t = text, t.isEmpty == false{
            fetchRequest.predicate = .init(format: "contents CONTAINS[c]  %@", t)
        }
        
        do{
            let resultSet = try self.context.fetch(fetchRequest)
            
            for record in resultSet{
                let data = MemoData()
                data.title = record.title
                data.contents = record.contents
                data.regdate = record.regdate! as Date
                data.objectID = record.objectID
                
                if let image = record.image{
                    data.image = UIImage(data: image)
                }
                
                memoList.append(data)
            }
        }catch let e as NSError{
            NSLog("An error has occured: %s", e.localizedDescription)
        }
        return memoList
    }
    
    func insert(_ data: MemoData){
        let object = NSEntityDescription.insertNewObject(forEntityName: "Memo", into: self.context) as! MemoMO
        
        object.title = data.title
        object.contents = data.contents
        object.regdate = data.regdate
        
        if let image = data.image{
            object.image = image.pngData()
        }
        
        do{
            try self.context.save()
        }catch let e as NSError{
            NSLog("An error has occured : %s", e.localizedDescription)
        }
    }
    
    func delete(_ objectID: NSManagedObjectID) -> Bool{
        let object = self.context.object(with: objectID)
        self.context.delete(object)
        
        do{
            try self.context.save()
            return true
        }catch let e as NSError{
            NSLog("An error has occured : %s", e.localizedDescription)
            return false
        }
    }
    
}
