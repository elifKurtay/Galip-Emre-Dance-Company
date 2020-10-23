//
//  StudentList.swift
//  Company
//
//  Created by Indian Blood on 8.07.2019.
//  Copyright © 2019 Indian Blood. All rights reserved.
//

import Cocoa

class Student: NSObject {
    @objc dynamic var name: String
    @objc dynamic var phone: String
    @objc dynamic var ders: String
    @objc dynamic var payment: String
    @objc dynamic var email: String
    
    
    
    init(info: String) {
        var infos = info.components(separatedBy: "//")
        self.name = infos[0]
        self.phone = infos[1]
        self.ders = infos[2]
        self.payment = infos[3]
        self.email = infos[4]
    }
    
}

class StudentMails: NSViewController {
    
    @IBOutlet weak var emails: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emails.stringValue = FileHelper().getStudentMails()
    }
}


class StudentList: NSViewController {
    
    @objc dynamic var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        students = FileHelper().allStudentsTable()
    }

}
