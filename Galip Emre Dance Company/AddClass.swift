//
//  AddClass.swift
//  Galip Emre Dance Company
//
//  Created by Elif Kurtay on 29.06.2019.
//  Copyright © 2019 Elif Kurtay. All rights reserved.
//

import Cocoa

class AddClass: NSViewController {
    
    @IBOutlet weak var classname: NSTextField!
    @IBOutlet weak var instoName: NSTextField!
    @IBOutlet weak var monthly: NSTextFieldCell!
    @IBOutlet weak var dersYorum: NSTextField!
    
    @IBOutlet weak var sosyal: NSButton!
    @IBOutlet weak var teknik: NSButton!
    
    @IBOutlet weak var startDate: NSDatePicker!
    @IBOutlet weak var day1: NSComboBox!
    @IBOutlet weak var time1: NSDatePicker!
    @IBOutlet weak var day2: NSComboBox!
    @IBOutlet weak var time2: NSDatePicker!
    
    @IBOutlet weak var alan: NSComboBox!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        startDate.dateValue = NSDate() as Date
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        
        if teknik.state == sosyal.state {
            let a = NSAlert()
            a.messageText = "Sınıf Özelliğinde Çift Tercih"
            a.informativeText = "Lütfen sınıf özelliği seçerken ya \"Teknik\" ya da \"Sosyal\" özelliği seçiniz."
            a.addButton(withTitle: "Tamam")
            a.alertStyle = NSAlert.Style.informational
            
            a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
                if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                    print("Sınıf özelliği seçilmemişti.")
                    
                }
            })
            return
        }
        var date = ""
        if teknik.stringValue == "1" {
            date = day1.stringValue + "&" + day2.stringValue + "//"
            date += time1.stringValue + "&" + time2.stringValue
        } else {
            date = day1.stringValue + "//" + time1.stringValue
        }
        let startDay = startDate.dateValue
        let newDate: Date = Calendar.current.date(byAdding: .day, value: 28, to: startDay)!
        print(newDate )
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        let dateStr: String = df.string(from: newDate)
        print(dateStr)
        
        //to db
        let info = [ classname.stringValue, instoName.stringValue, monthly.stringValue, dersYorum.stringValue, teknik.stringValue, date,alan.stringValue,"0", dateStr]
        
        if info.contains("") {
            let a = NSAlert()
            a.messageText = "Eksik Dolduruldu"
            a.informativeText = "Lütfen sınıf oluşturma formunda eksik alan bırakmayınız."
            a.addButton(withTitle: "Tamam")
            a.alertStyle = NSAlert.Style.informational
            
            a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
                if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                    print("eksik vardı.")
                }
            })
            return
        }
        FileHelper().createNewClass(infos: info)
        self.dismiss(self)
    }
}
