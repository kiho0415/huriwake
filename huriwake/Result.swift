//
//  Result.swift
//  huriwake
//
//  Created by 森田貴帆 on 2018/01/19.
//  Copyright © 2018年 森田貴帆. All rights reserved.
//

import RealmSwift

class Result: Object {
    static let realm = try! Realm()
    
    @objc dynamic var date: Date = Date()
    @objc dynamic var subjectname: String = ""
    @objc dynamic var startpage: Int = 0
    @objc dynamic var endpage: Int = 0

    static func loadAll() -> [Result] {
        let results = realm.objects(Result.self)
        var ret: [Result] = []
        for result in results {
            
            ret.append(result)
        }
        return ret
    }

    func save() {
        try! Result.realm.write {
            
            Result.realm.add(self)
        }
    }
    
    func update(method: (() -> Void)) {
        
        try! Result.realm.write {
            
            method()
            
        }
    }

    func  delete() {
        
        try! Result.realm.write {
            
            Result.realm.delete(self)
        }
        
    }
    
}
