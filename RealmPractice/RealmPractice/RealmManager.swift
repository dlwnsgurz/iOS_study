//
//  RealmManager.swift
//  RealmPractice
//
//  Created by LEE on 2023/03/15.
//

import UIKit
import RealmSwift


class RealmManager{
    
    static let shared = RealmManager()
    
    let realm = try! Realm()
    
}
