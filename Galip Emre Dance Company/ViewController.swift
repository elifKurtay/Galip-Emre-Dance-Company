//
//  ViewController.swift
//  DanceCompany
//
//  Created by Elif Kurtay on 2.07.2019.
//  Copyright © 2019 Dance Company. All rights reserved.
//

import Cocoa

class ClassSelect: NSViewController {
    
    
    @IBOutlet weak var sosyal: NSComboBox!

    @IBOutlet weak var teknik: NSComboBox!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sosyal.addItems( withObjectValues: FileHelper().getComboBoxData(group: 3))
       teknik.addItems(withObjectValues: FileHelper().getComboBoxData(group: 2))
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "TeknikClassSegue" {
            (segue.destinationController as! NSViewController).representedObject = teknik.stringValue
        }
        if segue.identifier == "SosyalClassSegue" {
            (segue.destinationController as! NSViewController).representedObject = sosyal.stringValue
        }
    }
}

class ViewController: NSViewController {
    @IBOutlet weak var studentComboList: NSComboBox!
    
    var nameList: [String] = []
    var fh = FileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //GEREKLİ TÜM CLASSLARI BİR KERE YARAT
        fh.createFiles()
        
        nameList = fh.getComboBoxData(group: 1)
        nameList.sort()
        studentComboList.addItems(withObjectValues: nameList )
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "StudentDetailSegue" {
            (segue.destinationController as! NSViewController).representedObject = studentComboList.stringValue
        }
        if segue.identifier == "ÖnKayıtListSegue" {
                print("ÖnKayıtListSegue çalışıyor.")
            }
    }
        
    @IBAction func updateStudentList(_ sender: Any) {
        nameList = fh.getComboBoxData(group: 1)
        nameList.sort()
        studentComboList.removeAllItems()
        studentComboList.addItems(withObjectValues: nameList)
    }
}

