//
//  AddStudent.swift
//  Galip Emre Dance Company
//
//  Created by Elif Kurtay on 29.06.2019.
//  Copyright © 2019 Elif Kurtay. All rights reserved.
//

import Cocoa

class AddStudent: NSViewController {
    
    //UI stuff
    @IBOutlet weak var stuNameLastname: NSTextFieldCell!
    @IBOutlet weak var bDay: NSDatePicker!
    @IBOutlet weak var regisDate: NSDatePicker!
    @IBOutlet weak var healthty: NSTextField!
    @IBOutlet weak var danceExp: NSTextField!
    @IBOutlet weak var veliInf: NSTextField!
    @IBOutlet weak var odemeDetay: NSTextField!
    @IBOutlet weak var telefon: NSTextField!
    @IBOutlet weak var email: NSTextField!
    @IBOutlet weak var dersSecim: NSComboBox!
    @IBOutlet weak var ikinciDers: NSComboBox!
    
    var fh = FileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        var dersler : [String] = fh.getComboBoxData(group: 2)
        dersler += fh.getComboBoxData(group: 3)
        dersler.sort()
        print(dersler)
        if dersler != [""] {
            dersSecim.addItems(withObjectValues: dersler)
            ikinciDers.addItems(withObjectValues: dersler)
        }
        regisDate.dateValue = NSDate() as Date
    }
    
    @IBAction func saveValues(_ sender: Any) {
        
        let name = stuNameLastname.stringValue
        if name == "" {
            let a = NSAlert()
            a.messageText = "Öğrenci Adı Girilmedi"
            a.informativeText = "Lütfen öğrencinin isim ve soyismini girin."
            a.addButton(withTitle: "Tamam")
            a.alertStyle = NSAlert.Style.informational
            
            a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
                if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                    print("Öğrenci adı girilmemişti.")
                }
            })
            return
        }
        let turBirthDate = dateFormat( date: bDay.stringValue.components(separatedBy: " ") )
        
        //if FileHelper().valide(name: name, dg: turBirthDate) {}
        let turRegisDate = dateFormat( date: regisDate.stringValue.components(separatedBy: " "))
        
        var ders = dersSecim.stringValue
        if ders == "" {
            ders = " "
            //ders seçin diye error!!!
            //ALERT
            let a = NSAlert()
            a.messageText = "Ders Seçilmedi"
            a.informativeText = "Lütfen öğrenci için ders seçiniz."
            a.addButton(withTitle: "Tamam")
            a.alertStyle = NSAlert.Style.informational
            
            a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
                if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                    print("Ders seçilmemişti.")
                }
            })
            return
        }
        if ikinciDers.stringValue != "" {
            ders += "&" + ikinciDers.stringValue
        }
        
        var health = healthty.stringValue
        if health == "" {
            health = "Sağlık bilgisi girilmemiştir."
        }
        var tel = telefon.stringValue
        if tel == "" {
            tel = "-"
        }
        var mail = email.stringValue
        if mail == "" {
            mail = "-"
        }
        var deneyim = danceExp.stringValue
        if deneyim == "" {
            deneyim = "Önceki dans deneyimi bilgileri girilmemiştir."
        }
        var veli = veliInf.stringValue
        if veli == "" {
            veli = "Veli bilgisi girilmemiştir."
        }
        var ödeme = odemeDetay.stringValue
        if ödeme == "" {
            ödeme = "Ödeme detayları ile ilgili bir bilgi girilmemiştir."
        }
        let info = [ name, turBirthDate, ders, turRegisDate, health, tel, mail, deneyim, veli, ödeme]
        fh.createNewStudent(info: info)
        self.dismiss(self)
    }
    
    func dateFormat(date: [String]) -> String {
        let month = date[1]
        let engMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        let turMonths = ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"]
        var ay = 0
        for mon in engMonths {
            if mon == month {
                return date[0] + " " + turMonths[ay] + " " + date[2]
            }
            ay += 1
        }
        return "- (date not entered)"
    }
}

