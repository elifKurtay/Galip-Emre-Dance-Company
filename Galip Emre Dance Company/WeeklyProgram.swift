	//
//  WeeklyProgram.swift
//  Galip Emre Dance Company
//
//  Created by Elif Kurtay on 29.06.2019.
//  Copyright © 2019 Elif Kurtay. All rights reserved.
//

import Cocoa

class Haftalık: NSObject {
    @objc dynamic var saatAralık: String
    @objc dynamic var pts: String
    @objc dynamic var salı: String
    @objc dynamic var cars: String
    @objc dynamic var pers: String
    @objc dynamic var cuma: String
    @objc dynamic var cts: String
    @objc dynamic var pazar: String
    
    init( info: String) {
        let array = info.components(separatedBy: "//")
        
        self.saatAralık = array[0]
        self.pts = array[1]
        self.salı = array[2]
        self.cars = array[3]
        self.pers = array[4]
        self.cuma = array[5]
        self.cts = array[6]
        self.pazar = array[7]
    }
}

class WeeklyProgram: NSViewController {

    @objc dynamic var week: [Haftalık] = [Haftalık(info: "10.00-12.00// //Modern Teknik// // // Çocuk Hiphop// // //"),Haftalık(info: "12.00-14.00//Modern Teknik// // // //Hiphop Başlangıç// // //")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func update(_ sender: Any) {
        //update file
    }
    
}
