//
//  Word.swift
//  RealmPractice
//
//  Created by LEE on 2023/03/14.
//

import Foundation
import RealmSwift

class Word: Object{
    
    @Persisted var word: String = ""
    @Persisted var meaning: String = ""
    @Persisted var birthDate: Date = Date()
    @Persisted var editDate: Date = Date()
    @Persisted var tags: List<Tag>
    @Persisted(primaryKey: true) var _id: ObjectId
}
