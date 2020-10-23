//
//  ClassList.swift
//  DanceCompany
//
//  Created by Elif Kurtay on 17.07.2019.
//  Copyright © 2019 Dance Company. All rights reserved.
//

import Cocoa

class Ders: NSObject {
    @objc dynamic var name: String
    @objc dynamic var cost: String
    @objc dynamic var hoca: String
    @objc dynamic var ogCount: String
    
    
    
    init(info: String) {
        var infos = info.components(separatedBy: "//")
        self.name = infos[0]
        self.cost = infos[1]
        self.hoca = infos[2]
        self.ogCount = infos[3]
    }
    
}

class ClassList: NSViewController {
    
    @objc dynamic var ders: [Ders] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        ders = FileHelper().allClassesTable()
    }
    
}
