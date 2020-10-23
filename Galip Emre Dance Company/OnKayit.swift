//
//  OnKayit.swift
//  DanceCompany
//
//  Created by Elif Kurtay on 23.08.2019.
//  Copyright © 2019 Dance Company. All rights reserved.
//

import Cocoa

class OnKayit: NSViewController {

    @IBOutlet weak var phone: NSTextField!
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var mail: NSTextField!
    @IBOutlet weak var alan: NSComboBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func kayıt(_ sender: Any) {
        //name, alan, phone, mail
        if name.stringValue == "" {
            let a = NSAlert()
            a.messageText = "Öğrenci İsmi Girilmedi"
            a.informativeText = "Lütfen ön kayıtın isim ve soyismini giriniz."
            a.addButton(withTitle: "Tamam")
            a.alertStyle = NSAlert.Style.informational
            
            a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
                if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                    print("ad seçilmemişti.")
                }
            })
            return
        }
        if alan.stringValue == "" {
            let a = NSAlert()
            a.messageText = "Alan Seçilmedi"
            a.informativeText = "Lütfen ön kayıtın ilgilendiği bir alan seçiniz."
            a.addButton(withTitle: "Tamam")
            a.alertStyle = NSAlert.Style.informational
            
            a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
                if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                    print("Alan seçilmemişti.")
                }
            })
            return
        }
        var tel = phone.stringValue
        if tel == "" {
            tel = "-"
        }
        var email = mail.stringValue
        if email == "" {
            email = "-"
        }
        
        let info = [name.stringValue,alan.stringValue, tel, email]
        FileHelper().createNewPrereg(info: info)
        self.dismiss(self)
    }
}
