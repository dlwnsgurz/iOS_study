//
//  ViewController.swift
//  Chapter06-SQLite3
//
//  Created by LEE on 2023/02/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var db: OpaquePointer? = nil
        var stmt: OpaquePointer? = nil
        
        let dbPath = self.getDBPath()
        self.dbExecute(dbPath: dbPath)
        
        
    }

    func getDBPath() -> String{
        
        let fileManager = FileManager()
        let docPathURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path
        
        if fileManager.fileExists(atPath: dbPath) == false{
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")!
            try! fileManager.copyItem(atPath: dbSource, toPath: dbPath)
        }
        
        return dbPath
    }
    
    func dbExcute(dbPath: String){
        
        var db: OpaquePointer? = nil
    
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else {
            print("DATABASE CONNECT FAIL")
            return
        }
        
        defer{
            print("CLOSE DATABASE CONNECTION")
            sqlite3_close(db)
        }
        
        var stmt: OpaquePointer? = nil
        
        let sql = "CREATE TABLE IF NOT EXITES sequence (num INTEGER)"
        
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else {
            print("PREPARE STATEMENT FAIL")
            return
        }
        
        defer{
            print("FINALIZE STATEMENT")
            sqlite3_finalize(stmt)
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            print("CREATE TABLE SUCCESS!")
        }
            
    }
}

