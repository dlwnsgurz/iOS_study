//
//  Tag.swift
//  RealmPractice
//
//  Created by LEE on 2023/03/14.
//

import Foundation
import RealmSwift

class Tag: Object{
    
    @Persisted var name: String = ""
    @Persisted var count: Int = 0
    @Persisted(originProperty: "tags") var words: LinkingObjects<Word>
    
}
