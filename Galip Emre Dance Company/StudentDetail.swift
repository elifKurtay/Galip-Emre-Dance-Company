//
//  StudentDetail.swift
//  Galip Emre Dance Company
//
//  Created by Elif Kurtay on 29.06.2019.
//  Copyright © 2019 Elif Kurtay. All rights reserved.
//

import Cocoa

class StudentDetail: NSViewController {


    @IBOutlet weak var stuName: NSTextField!
    @IBOutlet weak var kayıt: NSTextField!
    @IBOutlet weak var dg: NSTextField!
    @IBOutlet weak var exp: NSTextField!
    @IBOutlet weak var health: NSTextField!
    @IBOutlet weak var telefon: NSTextField!
    @IBOutlet weak var veli: NSTextField!
    
    @IBOutlet weak var email: NSTextField!
    var stuClass: String = " "
    let fh = FileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let name = representedObject as! String
        if name != "" {
            stuName.stringValue = name
            let data = fh.readStudentDetail(studentName: name)
            if data != [" "] {
                initializePersonalFields(values: data)
                stuClass = data[2]
            }
        } // else error bubble "Please pick a student name"
        else {
            self.dismiss(self)
        }
    }
    
    @IBAction func deletePerson(_ sender: Any) {
        let a = NSAlert()
        a.messageText = "Öğrenci Kaydı Silmek"
        a.informativeText = "Öğrenci kaydını silmek istediğinizden emin misiniz?"
        a.addButton(withTitle: "Sil")
        a.addButton(withTitle: "İptal Et")
        a.alertStyle = NSAlert.Style.warning
        
        a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
            if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                self.fh.deleteStudent(studentName: self.stuName.stringValue)
                print("Student deleted")
                self.dismiss(self)
            }
        })
    }
    
    func initializePersonalFields(values: [String]) {
        print(values)
        if values.count > 8 {
            exp.stringValue = values[7]
            kayıt.stringValue += " " + values[3]
            dg.stringValue += " " + values[1]
            health.stringValue = values[4]
            telefon.stringValue = values[5]
            email.stringValue = values[6]
            veli.stringValue = values[8]
        }
    }
    
    @IBAction func toClassSegues(_ sender: Any) {
        let teknikler: [String] = fh.getComboBoxData(group: 2)
        if teknikler.contains(stuClass) {
            performSegue(withIdentifier: "StudentToTeknikClassSegue", sender: self)
        }
        else {
            performSegue(withIdentifier: "StudentToSosyalClassSegue", sender: self)
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "StudentToSosyalClassSegue" {
            (segue.destinationController as! NSViewController).representedObject = stuClass
        }
        if segue.identifier == "StudentToTeknikClassSegue" {
            (segue.destinationController as! NSViewController).representedObject = stuClass
        }
        if segue.identifier == "StudentToPaymentSegue" {
            let allinfo = FileHelper().readClassDetail(className: stuClass)
            var info = [" "]
            if allinfo != ["Class NOT Found"] {
                info.removeAll()
                info.append(stuName.stringValue)
                info.append(allinfo[2])
                info.append(allinfo[9])
            }
            (segue.destinationController as! NSViewController).representedObject = info
            
        }
    }
}

class PaymentDetail: NSViewController {
    @objc dynamic var payment = [Payment]()
    
    @IBOutlet weak var aylik: NSTextField!
    @IBOutlet weak var nextOdeme: NSTextField!
    @IBOutlet weak var odemeDetayı: NSTextField!
    var stuName: String = ""
    var eski = [Double]()
    var fh = FileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let info = representedObject as! [String]
        if info !=  [" "] {
            stuName = info[0]
            self.payment = fh.getPaymentTable(stuName: stuName)
            nextOdeme.stringValue += " " + info[2]
            aylik.stringValue += " " + info[1]
            
            let infos = fh.readStudentDetail(studentName: stuName)
            odemeDetayı.stringValue = infos[9]
            
            for pay in payment {
                eski.append( Double(pay.miktar) )
            }
        }
        self.paymentTable.rowHeight = 20.0
    }
    
    @IBOutlet weak var paymentTable: NSTableView!
    @IBAction func updateFile(_ sender: Any) {
        
        fh.setPaymentTable(stuName: stuName, newValues: payment)
        
        for index in 0..<(payment.count) {
            let pay: Payment = payment[index]
            //update kasa
            let yeni: Double = Double(pay.miktar)
            if eski[index] != yeni {
                let zaman: String = fh.getCurrentDate()
                let kasa: String = fh.getÖdemeler(date: zaman)
                
                let fark = yeni - eski[index]
                print("Fark: ", fark)
                let son = fark + (Double(kasa) ?? 0)
                print("Son: ", son)
                fh.setÖdemeler(newRowValue: "Ödemeler/" + String(son), date: zaman)
            }
        }
    }
    
    
}

class Payment: NSObject {
    @objc dynamic var donem: String
    @objc dynamic var ders: String
    @objc dynamic var miktar: Int
    @objc dynamic var yorum: String
    
    init(info: String) {
        let array = info.components(separatedBy: "//")
        self.donem = array[0]
        self.yorum = array[3]
        self.miktar = Int(array[2]) ?? 0
        self.ders = array[1]
    }
}
