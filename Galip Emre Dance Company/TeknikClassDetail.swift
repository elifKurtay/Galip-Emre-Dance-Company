//
//  TeknikClassDetail.swift
//  DanceCompany
//
//  Created by Elif Kurtay on 17.07.2019.
//  Copyright © 2019 Dance Company. All rights reserved.
//

import Cocoa

class TeknikDevamsızlık: NSObject {
    @objc dynamic var name: String
    @objc dynamic var ders1: String
    @objc dynamic var ders2: String
    @objc dynamic var ders3: String
    @objc dynamic var ders4: String
    @objc dynamic var ders5: String
    @objc dynamic var ders6: String
    @objc dynamic var ders7: String
    @objc dynamic var ders8: String
    @objc dynamic var payStatus: String
    @objc dynamic var yorum: String
    
    init( info: String) {
        let arr = info.components(separatedBy: "/")
        name = arr[0]
        ders1 = arr[1]
        ders2 = arr[2]
        ders3 = arr[3]
        ders4 = arr[4]
        ders5 = arr[5]
        ders6 = arr[6]
        ders7 = arr[7]
        ders8 = arr[8]
        payStatus = arr[9]
        yorum = arr[10]
    }
}

class TeknikClassDetail: NSViewController {
    
    @objc dynamic var absence = [TeknikDevamsızlık]()
    
    @IBOutlet weak var studentNum: NSTextField!
    @IBOutlet weak var class_name: NSTextField!
    @IBOutlet weak var instructor: NSTextField!
    @IBOutlet weak var comments: NSTextField!
    @IBOutlet weak var cost: NSTextField!
    @IBOutlet weak var nextPayDate: NSTextField!
    @IBOutlet weak var tableLevel: NSComboBox!
    
    @IBOutlet weak var time1: NSDatePicker!
    @IBOutlet weak var day1: NSComboBox!
    @IBOutlet weak var day2: NSComboBox!
    @IBOutlet weak var time2: NSDatePicker!
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
            
            let table = fh.getTeknikClassAbsence(name: name, choice: "current")
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
                day1.stringValue = info[5].components(separatedBy: "&")[0]
                day2.stringValue = info[5].components(separatedBy: "&")[1]
                df.dateFormat = "HH:mm"
                let timeDate1: Date = df.date(from: info[6].components(separatedBy: "&")[0])!
                time1.dateValue = timeDate1
                let timeDate2: Date = df.date(from: info[6].components(separatedBy: "&")[1])!
                time2.dateValue = timeDate2
                studentNum.stringValue += " " + info[8]
                nextPayDate.stringValue = info[9]
            }
        } else {
            self.dismiss(self)
        }
    }
    
    
    @IBAction func changeTable(_ sender: Any) {
        //let date = Date()
        var zaman = tableLevel.stringValue
        if zaman == "" {
            zaman = String(fh.getClassLevel(className: class_name.stringValue).count)
        }
        
        //Continue here
        self.absence = fh.getTeknikClassAbsence(name: class_name.stringValue, choice: zaman)
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
    
    @IBAction func save(_ sender: Any) {
        var info = [String]()
        //eğitmen(1), ücret(2), yorum(3), günler(5), saatler(6),ödeme tarihi(9)
        info.append(instructor.stringValue)
        info.append(cost.stringValue)
        info.append(comments.stringValue)
        info.append(day1.stringValue + "&" + day2.stringValue)
        info.append(time1.stringValue + "&" + time2.stringValue)
        info.append(nextPayDate.stringValue)
        FileHelper().setClassInfo(className: class_name.stringValue, info: info)
    }
    
    func getDate() -> String {
        let date = Date()
        let cal = Calendar.current
        let gün = cal.component(.day, from: date)
        let ay = cal.component(.month, from: date)
        let yıl = cal.component(.year, from: date)
        
        return String(gün) + "." + String(ay) + "." + String(yıl)
    }
    
    
    @IBOutlet weak var absenceTeknikTable: NSTableView!
    @IBAction func updateFile(_ sender: Any) {
        var zaman = tableLevel.stringValue
        if zaman == "" {
            zaman = String(fh.getClassLevel(className: class_name.stringValue).count)
        }
        
        let index: Int = absenceTeknikTable.selectedRow
        if index > -1 {
            let sosyal: TeknikDevamsızlık = absence[index]
            let newRow = sosyal.name + "/" + sosyal.ders1 + "/" + sosyal.ders2 + "/" + sosyal.ders3 + "/" + sosyal.ders4 + "/" + sosyal.ders5 + "/" + sosyal.ders6 + "/" + sosyal.ders7 + "/" + sosyal.ders8 + "/" + sosyal.payStatus + "/" + sosyal.yorum
            fh.setClassTable(className: class_name.stringValue, newRowValue: newRow, index: index, level: zaman)
        }
    }
    
    @IBAction func goToStu(_ sender: Any) {
        let index: Int = absenceTeknikTable.selectedRow
        if index < 0 {
            return
        }
        performSegue(withIdentifier: "TeknikToStudentSegue", sender: self)
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let index: Int = absenceTeknikTable.selectedRow
        let sosyal: TeknikDevamsızlık = absence[index]
        let stuName = sosyal.name
        if segue.identifier == "TeknikToStudentSegue" {
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
