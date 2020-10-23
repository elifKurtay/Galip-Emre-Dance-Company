//
//  Kasa.swift
//  Galip Emre Dance Company
//
//  Created by Elif Kurtay on 29.06.2019.
//  Copyright © 2019 Elif Kurtay. All rights reserved.
//

import Cocoa

class KasaGelir: NSObject {
    
    @objc dynamic var giris:String
    @objc dynamic var girMiktar:String
    
    
    init(giris: String, girMiktar: String) {
        self.giris = giris
        self.girMiktar = girMiktar
    }
}

class KasaGider: NSObject {
    @objc dynamic var giden: String
    @objc dynamic var gitMiktar: String
    
    init(giden: String, gitMiktar: String) {
        self.giden = giden
        self.gitMiktar = gitMiktar
    }
}

class Kasa: NSViewController {
    
    @objc dynamic var entry: [KasaGelir] = FileHelper().getKasaGelir(date: "current")
    @objc dynamic var exit: [KasaGider] = FileHelper().getKasaGider(date: "current")
    
    @IBOutlet weak var totalGiris: NSTextField!
    @IBOutlet weak var totalPara: NSTextField!
    @IBOutlet weak var tableTime: NSDatePicker!
    @IBOutlet weak var totalGidis: NSTextField!
    var simdi: Bool = true
    let fh = FileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels(date: getCurrentDate() )
        tableTime.dateValue = NSDate() as Date
    }
    
    @IBOutlet weak var girisTable: NSTableView!
    
    @IBOutlet weak var gidisTable: NSTableView!
    @IBAction func tableAction(_ sender: Any) {
        
        var zaman = getCurrentDate()
        if !simdi {
            zaman = dateFormat(date: tableTime.stringValue.components(separatedBy: " "))
        }
        //UPDATE FİLE HERE
        //giriş table update
        fh.setKasaGelir(newValues: entry, date: zaman)
        
        // gidiş table update
        fh.setKasaGider(newValues: exit, date: zaman)
        
        updateLabels(date: zaman)
    }
    
    @IBAction func changeTables(_ sender: Any) {
        //CHANGE ARRAYS
        let zaman = dateFormat(date: tableTime.stringValue.components(separatedBy: " "))
        
        self.entry = fh.getKasaGelir(date: zaman)
        self.exit = fh.getKasaGider(date: zaman)
        simdi = false
    }
    
    func updateLabels(date: String) {
        var sumGelen = 0.0
        var sumGiden = 0.0
        
        for row in entry {
            sumGelen += Double(row.girMiktar) ?? 0.0
        }
        for row in exit {
            sumGiden -= Double(row.gitMiktar) ?? 0.0
        }
        totalGiris.stringValue = "Toplam Gelir: " + String(sumGelen)
        totalGidis.stringValue = "Toplam Gider: " + String(sumGiden)
        totalPara.stringValue = "Aylık Kasa Bakiyesi: " + String(sumGelen + sumGiden)
        
        
        fh.setSezonInfo(date: date, info: String(sumGelen) + "/" + String(sumGiden))
        
    }
    
    func dateFormat(date: [String]) -> String {
        let month = date[1]
        let engMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        var ay = 1
        for mon in engMonths {
            if mon == month {
                return String(ay) + "." + date[2]
            }
            ay += 1
        }
        return "- (date not entered)"
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let cal = Calendar.current
        let ay = cal.component(.month, from: date)
        let yıl = cal.component(.year, from: date)
        
        return String(ay) + "." + String(yıl)
    }
}
