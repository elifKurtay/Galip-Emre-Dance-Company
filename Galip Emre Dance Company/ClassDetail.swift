//
//  ClassDetail.swift
//  Galip Emre Dance Company
//
//  Created by Elif Kurtay on 29.06.2019.
//  Copyright © 2019 Elif Kurtay. All rights reserved.
//

import Cocoa
class SosyalDevamsızlık: NSObject {
    @objc dynamic var name: String
    @objc dynamic var ders1: String
    @objc dynamic var ders2: String
    @objc dynamic var ders3: String
    @objc dynamic var ders4: String
    @objc dynamic var payStatus: String
    @objc dynamic var yorum: String
    
    init( info: String) {
        let arr = info.components(separatedBy: "/")
        name = arr[0]
        ders1 = arr[1]
        ders2 = arr[2]
        ders3 = arr[3]
        ders4 = arr[4]
        payStatus = arr[5]
        yorum = arr[6]
    }
}

class ClassDetail: NSViewController {
    @objc dynamic var absence: [SosyalDevamsızlık] = []
   
    @IBOutlet weak var studentNum: NSTextField!
    @IBOutlet weak var class_name: NSTextField!
    @IBOutlet weak var instructor: NSTextField!
    @IBOutlet weak var comments: NSTextField!
    @IBOutlet weak var cost: NSTextField!
    
    @IBOutlet weak var nextPayDate: NSTextField!
    @IBOutlet weak var tableLevel: NSComboBox!
    @IBOutlet weak var time: NSDatePicker!
    @IBOutlet weak var day: NSComboBox!
    let fh = FileHelper()
    let df = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let name = representedObject as! String
        if name != "" {
            class_name.stringValue = name
            
            tableLevel.addItems(withObjectValues: fh.getClassLevel(className: name))
            
            let temp = fh.getPayStatus(name: name)
            var dateStr = ""
            if temp.contains(" ") {
                dateStr = temp.components(separatedBy: " ")[1]
            }
            else {
                dateStr = temp
            }
            let table = fh.getClassAbsence(name: name, choice: "current")
            if table.count > 0 {
                absence = table
            }
            
            if dateStr != "" && dateStr.components(separatedBy: ".").count > 2 {
                if  isBiggerThan(first: getDate(), second: dateStr)  {
                    fh.updateClassMonth(name: name)
                    
                    let donem = dateStr + "-" + fh.nextDate(oldDate: dateStr) + "//"
                    for i in 0..<(absence.count) {
                        fh.setPaymentRow(stuName: absence[i].name, newRowValue: donem + name + "//0//-", index: -1)
                    }
                }
            }
            
            
            let info = fh.readClassDetail(className: name)
            if info.count > 9 {
                instructor.stringValue = info[1]
                cost.stringValue = info[2]
                comments.stringValue = info[3]
                day.stringValue = info[5]
                
                df.dateFormat = "HH:mm"
                let timeDate: Date = df.date(from: info[6])!
                time.dateValue = timeDate
                studentNum.stringValue += " " + info[8]
                nextPayDate.stringValue = info[9]
            }
        }
    }
    
    @IBAction func save(_ sender: Any) {
        var info = [String]()
        //eğitmen(1), ücret(2), yorum(3), günler(5), saatler(6),ödeme tarihi(9)
        info.append(instructor.stringValue)
        info.append(cost.stringValue)
        info.append(comments.stringValue)
        info.append(day.stringValue)
        //time HH:mm bu şekilde yazma
        let times = time.stringValue.components(separatedBy: ":00 ")
        print("Times:")
        print(times)
        let start = times[0].index(times[0].endIndex, offsetBy: -5)
        let range = start..<times[0].endIndex
        var saat = times[0][range]
        
        if times.count > 2 {
            let start = times[1].index(times[1].endIndex, offsetBy: -5)
            let range = start..<times[1].endIndex
            saat += "&" + times[1][range]
        }
        info.append(String(saat) )
        info.append(nextPayDate.stringValue)
        fh.setClassInfo(className: class_name.stringValue, info: info)
    }
    
    @IBAction func delete(_ sender: Any) {
        //ALERT
        let a = NSAlert()
        a.messageText = "Dersi Silmek?"
        a.informativeText = "Dersi silmek istediğinizden emin misiniz?"
        a.addButton(withTitle: "Sil")
        a.addButton(withTitle: "İptal Et")
        a.alertStyle = NSAlert.Style.warning
        
        a.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
            if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                self.fh.deleteClass(name: self.class_name.stringValue)
                print("Class deleted")
                self.dismiss(self)
            }
        })
    }
    
    
    func getDate() -> String {
        let date = Date()
        let cal = Calendar.current
        let gün = cal.component(.day, from: date)
        let ay = cal.component(.month, from: date)
        let yıl = cal.component(.year, from: date)
        
        return String(gün) + "." + String(ay) + "." + String(yıl)
    }
    
    @IBAction func changeTable(_ sender: Any) {
        
        var zaman = tableLevel.stringValue
        if zaman == "" {
            zaman = String(fh.getClassLevel(className: class_name.stringValue).count)
        }
        //Continue here
        self.absence = fh.getClassAbsence(name: class_name.stringValue, choice: zaman)
    }
    
    @IBOutlet weak var absenceTable: NSTableView!
    @IBAction func updateTable(_ sender: Any) {
        
        var zaman = tableLevel.stringValue
        if zaman == "" {
            zaman = String(fh.getClassLevel(className: class_name.stringValue).count)
        }
        print(zaman)
        
        let index: Int = absenceTable.selectedRow
        if index > -1 {
            let sosyal: SosyalDevamsızlık = absence[index]
           let newRow = sosyal.name + "/" + sosyal.ders1 + "/" + sosyal.ders2 + "/" + sosyal.ders3 + "/" + sosyal.ders4 + "/" + sosyal.payStatus + "/" + sosyal.yorum
            fh.setClassTable(className: class_name.stringValue, newRowValue: newRow, index: index, level: zaman)
        }
    }
    @IBAction func goToStudent(_ sender: Any) {
        let index: Int = absenceTable.selectedRow
        if index < 0 {
            return
        }
        performSegue(withIdentifier: "ClassToStudentSegue", sender: self)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let index: Int = absenceTable.selectedRow
        let sosyal: SosyalDevamsızlık = absence[index]
        let stuName = sosyal.name
        if segue.identifier == "ClassToStudentSegue" {
            (segue.destinationController as! NSViewController).representedObject = stuName
        }
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
    
    func isBiggerThan(first: String, second: String) -> Bool {
        let birinci = first.components(separatedBy: ".")
        let ikinci = second.components(separatedBy: ".")
        if Int(birinci[2])! > Int(ikinci[2])! {
            return true
        } else if Int(birinci[2])! < Int(ikinci[2])! {
            return false
        }
        if Int(birinci[1])! > Int(ikinci[1])! {
            return true
        } else if Int(birinci[1])! < Int(ikinci[1])! {
            return false
        }
        if Int(birinci[0])! > Int(ikinci[0])! {
            return true
        } else if Int(birinci[0])! < Int(ikinci[0])! {
            return false
        }
        return false
    }
}
