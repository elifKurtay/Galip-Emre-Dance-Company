//
//  SeasonalKasa.swift
//  Galip Emre Dance Company
//
//  Created by Elif Kurtay on 29.06.2019.
//  Copyright © 2019 Elif Kurtay. All rights reserved.
//

import Cocoa

class Sezon: NSObject {
    @objc dynamic var sezon: String
    @objc dynamic var giris: Double
    @objc dynamic var giden: Double
    @objc dynamic var toplam: Double
    
    init(name: String, giris: Double, giden: Double) {
        self.sezon = name
        self.giris = giris
        self.giden = giden
        self.toplam = giris + giden
    }
}

class SeasonalKasa: NSViewController {

    @objc dynamic var sezon: [Sezon] = FileHelper().getSezonKasa()
    
    @IBOutlet weak var total: NSTextField!
    @IBOutlet weak var table: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.table.rowHeight = 35.0
        
        var sum = 0.0
        for row in sezon {
            sum += row.toplam
        }
        total.stringValue = "Total Bakiye: " + String(sum)
        
    }
    
}
