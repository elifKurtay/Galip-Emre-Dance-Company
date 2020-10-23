//
//  OnKayitList.swift
//  DanceCompany
//
//  Created by Elif Kurtay on 17.07.2019.
//  Copyright © 2019 Dance Company. All rights reserved.
//

import Cocoa

class Prereg: NSObject {
    @objc dynamic var name: String
    @objc dynamic var phone: String
    @objc dynamic var alan: String
    @objc dynamic var email: String
    
    init(info: String) {
        var infos = info.components(separatedBy: "//")
        self.name = infos[0]
        self.phone = infos[2]
        self.alan = infos[1]
        self.email = infos[3]
    }
}
class OnKayitList: NSViewController {
    
    @objc dynamic var preregs: [Prereg] = []
    
    var fh = FileHelper()
    var student = ""
    @IBAction func deletePrereg(_ sender: Any) {
        if student != "" {
            //ALERT?
            let a = NSAlert()
            a.messageText = "Ön kayıt silinsin mi?"
            a.informativeText = "Ön kayıdı silmek istediğinizden emin misiniz?"
            a.addButton(withTitle: "Sil")
            a.addButton(withTitle: "İptal Et")
            a.alertStyle = NSAlert.Style.warning
            
            a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
                if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                    self.fh.deletePreregStudent(studentName: self.student)
                    print("Ön kayıt silindi")
                    self.preregs = self.fh.allPreregStudentsTable()
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let dataStu = fh.allPreregStudentsTable()
        
        if dataStu.count > 0 {
            preregs = dataStu
        }
    }
    
    @IBOutlet weak var table: NSTableView!
    
    @IBAction func selectTable(_ sender: Any)  {
        let index: Int = table.selectedRow
        print(index)
        if index > -1 {
            let git: Prereg = preregs[index]
            student = git.name
        }
        print(student)
    }
    
}
    
class PreregMails: NSViewController {
    
    @IBOutlet weak var filtre: NSComboBox!
    let fh = FileHelper()
    
    @IBAction func filter(_ sender: Any) {
        let secim = filtre.stringValue
        if secim == "Modern" {
            //filter no: 1
            emails.stringValue = fh.getPreregMails(no: 1)
        }
        else if secim == "Hiphop" {
            //filter no:2
            emails.stringValue = fh.getPreregMails(no: 2)
        }
        else if secim == "Düğün Dansı" {
            //filter no:3
            emails.stringValue = fh.getPreregMails(no: 3)
        }
        else if secim == "Tap Dans" {
            //filter no:4
            emails.stringValue = fh.getPreregMails(no: 4)
        }
        else if secim == "Özel Ders" {
            //filter no:2
            emails.stringValue = fh.getPreregMails(no: 5)
        }
        else if secim == "Latin" {
            //filter no:3
            emails.stringValue = fh.getPreregMails(no: 6)
        }
        else if secim == "Diğer" {
            //filter no:4
            emails.stringValue = fh.getPreregMails(no: 7)
        }
        else if secim == "Çocuk" {
            //filter no:4
            emails.stringValue = fh.getPreregMails(no: 8)
        }
    }
    
    @IBOutlet weak var emails: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emails.stringValue = fh.getPreregMails(no: 0)
    }
}


