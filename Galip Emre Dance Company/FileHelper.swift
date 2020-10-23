//
//  FileHelper.swift
//  DanceCompany
//
//  Created by Elif Kurtay on 14.07.2019.
//  Copyright © 2019 Dance Company. All rights reserved.
//

import Foundation

class FileHelper {
    //file yaratılış kodları
    func createFiles() {
        var exist = "nop"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent("Listeler").appendingPathExtension("txt")
            //reading
            do {
                exist = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
        if exist == "nop" {
             // Listeler
            let dir1 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl1 = dir1.appendingPathComponent("Listeler").appendingPathExtension("txt")
             do {
             try " /*/ /*/ /*/ ".write(to: fileUrl1, atomically: true, encoding: .utf8)
             } catch {
             print(error)
             }
            
            //Student Details
            let dir2 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl2 = dir2.appendingPathComponent("StudentDetails").appendingPathExtension("txt")
             do {
             try "".write(to: fileUrl2, atomically: true, encoding: .utf8)
             } catch {
             print(error)
             }
            //Class Details
            let dir3 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl3 = dir3.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
             do {
             try "".write(to: fileUrl3, atomically: true, encoding: .utf8)
             } catch {
             print(error)
             }
            //Unreg Details
            let dir4 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl4 = dir4.appendingPathComponent("PreregistrationDetails").appendingPathExtension("txt")
             do {
             try "".write(to: fileUrl4, atomically: true, encoding: .utf8)
             } catch {
             print(error)
             }
            
            //LeKasaGelir
            let dir5 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl5 = dir5.appendingPathComponent("LeKasaGelir").appendingPathExtension("txt")
            do {
                let initial = "7.2019//Ödemeler/0//Impulse/0//Düğün Dansı/0//Kart Ücreti/0//Özel Ders/0//Diğer/0/*/8.2019//Ödemeler/0//Impulse/0//Düğün Dansı/0//Kart Ücreti/0//Özel Ders/0//Diğer/0/*/9.2019//Ödemeler/0//Impulse/0//Düğün Dansı/0//Kart Ücreti/0//Özel Ders/0//Diğer/0/*/10.2019//Ödemeler/0//Impulse/0//Düğün Dansı/0//Kart Ücreti/0//Özel Ders/0//Diğer/0/*/11.2019//Ödemeler/0//Impulse/0//Düğün Dansı/0//Kart Ücreti/0//Özel Ders/0//Diğer/0/*/12.2019//Ödemeler/0//Impulse/0//Düğün Dansı/0//Kart Ücreti/0//Özel Ders/0//Diğer/0"
               try initial.write(to: fileUrl5, atomically: true, encoding: .utf8)
            } catch {
            print(error)
            }
            //LeKasaGider
            let dir6 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl6 = dir6.appendingPathComponent("LeKasaGider").appendingPathExtension("txt")
            
            do {
                let basla = "7.2019//Konut(kira, vergi, sigorta)/0//Aidat/0//Bakkaliye/0//Eğitmen Doğuş/0//Eğitmen Galip/0//Eğitmen Tina/0//Eğitmen Elif/0//Eğitmen Simce/0//Eğitmen Sercenk/0//Muhasebe/0//Kutsal Damacana/0//Sigorta/0//WC/0//Muhtasar/0//Kredi kartı/0//Diğer/0/*/8.2019//Konut(kira, vergi, sigorta)/0//Aidat/0//Bakkaliye/0//Eğitmen Doğuş/0//Eğitmen Galip/0//Eğitmen Tina/0//Eğitmen Elif/0//Eğitmen Simce/0//Eğitmen Sercenk/0//Muhasebe/0//Kutsal Damacana/0//Sigorta/0//WC/0//Muhtasar/0//Kredi kartı/0//Diğer/0/*/9.2019//Konut(kira, vergi, sigorta)/0//Aidat/0//Bakkaliye/0//Eğitmen Doğuş/0//Eğitmen Galip/0//Eğitmen Tina/0//Eğitmen Elif/0//Eğitmen Simce/0//Eğitmen Sercenk/0//Muhasebe/0//Kutsal Damacana/0//Sigorta/0//WC/0//Muhtasar/0//Kredi kartı/0//Diğer/0/*/10.2019//Konut(kira, vergi, sigorta)/0//Aidat/0//Bakkaliye/0//Eğitmen Doğuş/0//Eğitmen Galip/0//Eğitmen Tina/0//Eğitmen Elif/0//Eğitmen Simce/0//Eğitmen Sercenk/0//Muhasebe/0//Kutsal Damacana/0//Sigorta/0//WC/0//Muhtasar/0//Kredi kartı/0//Diğer/0/*/11.2019//Konut(kira, vergi, sigorta)/0//Aidat/0//Bakkaliye/0//Eğitmen Doğuş/0//Eğitmen Galip/0//Eğitmen Tina/0//Eğitmen Elif/0//Eğitmen Simce/0//Eğitmen Sercenk/0//Muhasebe/0//Kutsal Damacana/0//Sigorta/0//WC/0//Muhtasar/0//Kredi kartı/0//Diğer/0/*/12.2019//Konut(kira, vergi, sigorta)/0//Aidat/0//Bakkaliye/0//Eğitmen Doğuş/0//Eğitmen Galip/0//Eğitmen Tina/0//Eğitmen Elif/0//Eğitmen Simce/0//Eğitmen Sercenk/0//Muhasebe/0//Kutsal Damacana/0//Sigorta/0//WC/0//Muhtasar/0//Kredi kartı/0//Diğer/0"
                try basla.write(to: fileUrl6, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
            //SezonsalKasa
            let dir7 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl7 = dir7.appendingPathComponent("SezonsalKasa").appendingPathExtension("txt")
            
            do {
                try "Yaz 2019//7.2019/0/0//8.2019/0/0/*/Güz'19//9.2019/0/0//10.2019/0/0".write(to: fileUrl7, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    //COMBO BOX HELPER------------------------------------------------------------------------------------------------------------
    //reads ComboBox data from Listeler.txt
    //param group: 1 for registrated stu
    //2 for teknik 3 for sosyal classes and 4 for unregistrated stu
    func getComboBoxData( group: Int) -> [String] {
        var textTrio = [String]() //eskiden üç grup vardı ondan trio çok takılma
        //Listeler.txt'e gidiyor
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("Listeler").appendingPathExtension("txt")
            //reading
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                print(text)
                if text != "" {
                    textTrio = text.components(separatedBy: "/*/")
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            //grup 1 öğrenciler, öğrenciler arası ',' ile ayrılmış
            if( group == 1 && textTrio[0] != " ") {
                if textTrio[0].contains(",") {
                    return textTrio[0].components(separatedBy: ",")
                } else {
                    return [textTrio[0]]
                }
            }
            else if (group == 2 && textTrio[1] != " ") {
                if textTrio[1].contains(",") {
                    return textTrio[1].components(separatedBy: ",")
                } else {
                    return [textTrio[1]]
                }
            }
            else if (group == 3 && textTrio[2] != " ") {
                if textTrio[2].contains(",") {
                    return textTrio[2].components(separatedBy: ",")
                } else {
                    return [textTrio[2]]
                }
            }
            else if (group == 4 && textTrio[3] != " ") {
                if textTrio[3].contains(",") {
                    return textTrio[3].components(separatedBy: ",")
                } else {
                    return [textTrio[3]]
                }
            }
        }
        return [" "]
    }
    
    //adding new values to combo list
    func addToComboList(name: String, group: Int) {
        var newText: String = " "
        
        //updating combo box list
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("Listeler").appendingPathExtension("txt")
            
            //reading
            do {
                let previousText = try String(contentsOf: fileURL, encoding: .utf8)
                let grup = previousText.components(separatedBy: "/*/")[group - 1]
                
                //check for repeated actions
                if ( grup != " ") {
                    //grupta birden fazla isim varsa virgülle ayırıp hepsini kontrol et
                    if grup.contains(",") {
                        for student in grup.components(separatedBy: ",") {
                            if name == student {
                                print("Opss i did it again")
                                return
                            }
                        }
                    } else {
                        //grupta tek isim varsa sadece onu kontrol et
                        if name == grup {
                            print("Opss i did it again")
                            return
                        }
                    }
                }
                //istenilen grubun string ini al
                var previous = previousText.components(separatedBy: "/*/")
                let changingGrup = previous[group - 1]
                
                //alınan string ismi ekle, eğer string boşsa string i isim yap
                if changingGrup != " " {
                    newText = changingGrup + "," + name
                } else {
                    newText = name
                }
                //yeni string i array e ekleyip eski string i sil
                previous.insert(newText,at: group - 1 )
                previous.remove(at: group)
                //yeni array i ayırıcı işaretle birleştir
                newText = previous.joined(separator: "/*/")
                //yeni text i dosyaya geri yaz
                //writing
                do {
                    try newText.write(to: fileURL, atomically: true, encoding: .utf8)
                    print(newText)
                }
                catch let error as NSError {
                    print("ERROR")
                    print( error)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
    }//DONE

    //deleting values from combo list
    func deleteInComboList(name: String, group: Int) {
        var newText: String = " "
        var there: Bool = false
        
        //combo box listelere git
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("Listeler").appendingPathExtension("txt")
            
            //reading
            do {
                let previousText = try String(contentsOf: fileURL, encoding: .utf8)
                let grup = previousText.components(separatedBy: "/*/")[group - 1]
                var index = -1
                //silincek öğrenci var mı diye kontrol et
                if grup != " " {
                    //grupta birden fazla isim varsa virgülle ayırıp hepsini kontrol et
                    if grup.contains(",") {
                        var i = 0
                        for student in grup.components(separatedBy: ",") {
                            if name == student {
                                print("Found the student!")
                                there = true
                                index = i
                            }
                            i += 1
                        }
                    } else {
                        //grupta tek isim varsa sadece onu kontrol et
                        if name == grup {
                            print("Found the student!")
                            there = true
                        }
                    }
                }
                //eğer öğrenci yoksa methoddan çık
                if !there {
                    print("Student does not exist")
                    return
                } else {
                    //istenilen grubun string ini al
                    var previous = previousText.components(separatedBy: "/*/")
                    
                    //alınan stringde ismi çıkar ve geri kalan array i birleştir
                    if grup.contains(",") {
                        var grupArr = grup.components(separatedBy: ",")
                        if index > -1 {
                            grupArr.remove(at: index)
                        }
                        if grupArr.count > 1 {
                            newText = grupArr.joined(separator: ",")
                        } else if grupArr.count == 1 {
                            newText = grupArr[0]
                        }
                    } else {
                        newText = " "
                    }
                    
                    //yeni string i array e ekleyip eski string i sil
                    previous.insert(newText,at: group - 1 )
                    previous.remove(at: group)
                    //yeni array i ayırıcı işaretle birleştir
                    newText = previous.joined(separator: "/*/")
                    //writing newText
                    do {
                        try newText.write(to: fileURL, atomically: true, encoding: .utf8)
                        print(newText)
                    }
                    catch let error as NSError {
                        print("ERROR")
                        print( error)
                    }
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
    }//DONE
    
    //REG STUDENT--------------------------------------------------------------------------------------------------------------------------
    //STUDENT DETAİL HELP
    /* öğrenciler arası '/*/' öğrenci bilgileri arası '//'
 bilgi sırası: ad, dg,dersi,kayıt tarihi, sağlık durumu,
 telefon, email,dans deneyimi,veli,ödeme durumu */ */
    func createNewStudent(info: [String]) {
        var newStr: String = " "
        //öğrenciyi listelere ekler
        addToComboList(name: info[0], group: 1)
        let classname = info[2]
        //öğrenciyi dersin devamlılık tablosuna ekler
        if classname.contains("&") {
            addToClass(studentName: info[0], name: classname.components(separatedBy: "&")[0])
            addToClass(studentName: info[0], name: classname.components(separatedBy: "&")[1])
        } else if classname != " "{
            addToClass(studentName: info[0], name: classname)
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("StudentDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" {
                    newStr = text + "/*/"
                }
                else if text == " " {
                    newStr = ""
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            //adding new person
            newStr += info.joined(separator: "//")
            print(newStr)
            //writing the new version
            do {
                try newStr.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
        
        //deleting the same person in prereg list
        if getComboBoxData(group: 4).contains(info[0]) {
            deletePreregStudent(studentName: info[0])
        }
        
        //creating ödeme tablosunun file ı
        let dir4 = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl4 = dir4.appendingPathComponent(toFileName(name: info[0])).appendingPathExtension("txt")
        let payDate = getPayStatus(name: classname).components(separatedBy: " ")[1]
        let paytable = getCurrentDay() + "-" + payDate + "//" + classname + "//0//-"
        do {
            try paytable.write(to: fileUrl4, atomically: true, encoding: .utf8)
        } catch {
            print(error)
        }
    }
    
    //read the infos of the wanted student for student details page
    func readStudentDetail(studentName: String) -> [String] {
        var allStus = [""]
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("StudentDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                //öğrencileri array e ayırıyor
                if text != "" && text.contains("/*/") {
                    allStus = text.components(separatedBy: "/*/")
                } else if text != "" {
                    allStus.removeAll() // boşluk filan varsa temizlesin diye (yaratılırken)
                    allStus.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            //searching for student
            if allStus != [""] {
                for stu in allStus {
                    let info = stu.components(separatedBy: "//")
                    if studentName == info[0] || (" " + studentName) ==   info[0] {
                        return info
                    }
                }
            }
        }
        return [" "]
    }//DONE
    
    //delete student
    func deleteStudent(studentName: String) {
        var lastStus: String = " "
        var allStus: [String] = []
        //deleting from combolist as well
        deleteInComboList(name: studentName, group: 1)
    
        //delete student account
        if let dir2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir2.appendingPathComponent(toFileName(name: studentName)).appendingPathExtension("txt")
            do {
                try FileManager().removeItem(atPath: fileURL.path)
            } catch {
                print(error)
            }
        }
        
        //deletin details
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("StudentDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    allStus = text.components(separatedBy: "/*/")
                } else if text != "" && text.components(separatedBy: "//")[0] == studentName {
                    lastStus = ""
                    let dersleri = text.components(separatedBy: "//")[2]
                    //dersin devamsızlık tablosundan silmek
                    if dersleri.contains("&") {
                        deleteFromClass(stuName: studentName, className: dersleri.components(separatedBy: "&")[0])
                        deleteFromClass(stuName: studentName, className: dersleri.components(separatedBy: "&")[1])
                    } else {
                        deleteFromClass(stuName: studentName, className: dersleri)
                    }
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            if lastStus != "" {
                var index = -1; var i = 0
                //searching for student
                for stu in allStus {
                    if studentName == stu.components(separatedBy: "//")[0] {
                        index = i
                        //deleting stu from class
                        let dersleri = stu.components(separatedBy: "//")[2]
                        if dersleri.contains("&") {
                            deleteFromClass(stuName: studentName, className: dersleri.components(separatedBy: "&")[0])
                            deleteFromClass(stuName: studentName, className: dersleri.components(separatedBy: "&")[1])
                        } else {
                            deleteFromClass(stuName: studentName, className: dersleri)
                        }
                    }
                    i += 1
                }
                //öğrencinin bulunduğu array i sil
                if index > -1 {
                    allStus.remove(at: index)
                }
                //geri kalan öğrencileri birleştir
                lastStus = allStus.joined(separator: "/*/")
            }
            //write new string to file
            do {
                try lastStus.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }//DONE
    
    //Tüm öğrenciler listesinin bilgileri Student objectinden oluşan bir arrayle yollanır
    //sayfanın array controllerine verilir
    //liste sıra: name, phone, classtaken, payStatus, mail
    func allStudentsTable() -> [Student] {
        var stuInfo: String = ""
        var allStus: [String] = [""]
        var tableInfos = [Student]()
        var stuDeets = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("StudentDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/"){
                    allStus = text.components(separatedBy: "/*/")
                } else if text != "" {
                    allStus.removeAll()
                    allStus.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            if allStus != [""]
            {
                //searching for student
                for stu in allStus {
                    if stu != "" {
                        stuDeets = stu.components(separatedBy: "//")
                        var payStat = ""
                        if stuDeets[2].contains("&") {
                            let ders1 = stuDeets[2].components(separatedBy: "&")[0]
                            let ders2 = stuDeets[2].components(separatedBy: "&")[1]
                            payStat = getPayStatus(name: ders1) + "&" + getPayStatus(name: ders2)
                        } else {
                            payStat = getPayStatus(name: stuDeets[2])
                        }
                        stuInfo = stuDeets[0] + "//" + stuDeets[5] + "//" + stuDeets[2] + "//" + payStat + "//" + stuDeets[6]
                        tableInfos.append( Student(info: stuInfo))
                    }
                }
            }
        }
        return tableInfos
    }//DONE
    
    //get student mails
    func getStudentMails() -> String {
        var mails = ""
        var allStus = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("StudentDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    allStus = text.components(separatedBy: "/*/")
                } else if text != "" {
                    allStus.removeAll()
                    allStus.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
        //get all the mails of students in a string
        for stu in allStus {
            mails += stu.components(separatedBy: "//")[6] + ","
        }
        return mails
    }//DONE
    
    //PAYMENT STATUS
    //son ödeme tarihi VE Gecikme durumu
    func getPayStatus(name: String) -> String {
        var str = "S.Ö.T.: "
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    let allClasses = text.components(separatedBy: "/*/")
                    for ders in allClasses {
                        if ders.components(separatedBy: "//")[0] == name {
                            str += ders.components(separatedBy: "//")[9]
                        }
                    }
                }
                else if text != "" {
                    str += text.components(separatedBy: "//")[9]
                }
            }
            catch let error as NSError {
                print("ERROR at getPayStatus:")
                print( error)
            }
        }
        return str
    }
    
    //bazı bilgileri updateliyoreeee
    //değişebilen bilgiler: sıradaki ödeme tarihi, eğitmen, ücret, comments, gün ve saatler
    func setClassInfo(className: String, info: [String]) {
        if let dir2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir2.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
            var final = ""
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    var allClasses = text.components(separatedBy: "/*/")
                    var i = 0; var index = 0; var new = ""
                    for ders in allClasses {
                        var dersComp = ders.components(separatedBy: "//")
                        if dersComp[0] == className {
                            index = i
                            dersComp.removeLast()
                            dersComp.append(info[5])
                            dersComp.remove(at: 1)
                            dersComp.insert(info[0],at: 1)
                            dersComp.remove(at: 2)
                            dersComp.insert(info[1],at: 2)
                            dersComp.remove(at: 3)
                            dersComp.insert(info[2],at: 3)
                            dersComp.remove(at: 5)
                            dersComp.insert(info[3],at: 5)
                            dersComp.remove(at: 6)
                            dersComp.insert(info[4],at: 6)
                            new = dersComp.joined(separator: "//")
                        }
                        i += 1
                    }
                    //değiştirdiğimizi geri birleştirmece
                    allClasses.remove(at: index)
                    allClasses.insert(new, at: index)
                    final = allClasses.joined(separator: "/*/")
                } else if text != "" {
                    //değiştir ve birleştir
                    var dersComp = text.components(separatedBy: "//")
                    dersComp.removeLast()
                    dersComp.append(info[5])
                    dersComp.remove(at: 1)
                    dersComp.insert(info[0],at: 1)
                    dersComp.remove(at: 2)
                    dersComp.insert(info[1],at: 2)
                    dersComp.remove(at: 3)
                    dersComp.insert(info[2],at: 3)
                    dersComp.remove(at: 5)
                    dersComp.insert(info[3],at: 5)
                    dersComp.remove(at: 6)
                    dersComp.insert(info[4],at: 6)
                    final = dersComp.joined(separator: "//")
                }
            }
            catch let error as NSError {
                print("ERROR at setSÖT:")
                print( error)
            }
            do {
                try final.write( to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    //PRE0REGISTRATION STU 00000000000000000000000000000000000000
    func createNewPrereg(info: [String]) {
        var newStr: String = ""
        addToComboList(name: info[0], group: 4)
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("PreregistrationDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" {
                    newStr = text + "/*/"
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            //adding new person
            newStr += info.joined(separator: "//")
            print(newStr)
            //writing the new version
            do {
                try newStr.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }//Done
    
    //delete student
    func deletePreregStudent(studentName: String) {
        var lastStus: String = ""
        var allStus: [String] = []
        //deleting from combolist as well
        deleteInComboList(name: studentName, group: 4)
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("PreregistrationDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    allStus = text.components(separatedBy: "/*/")
                }
                else if text != "" {
                    allStus.removeAll()
                    allStus.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            //searching for student and exclude it in new string
            var index = 0; var i = 0
            for stu in allStus {
                if studentName == stu.components(separatedBy: "//")[0] {
                    index = i
                }
                i += 1
            }
            allStus.remove(at: index)
            lastStus = allStus.joined(separator: "/*/")
            //write new string to file
            do {
                try lastStus.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }//DONE
    
    //Liste çıkar
    // liste sıra: name, interest, phone, email
    func allPreregStudentsTable() -> [Prereg] {
        var allStus: [String] = []
        var allPregs: [Prereg] = []
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("PreregistrationDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/"){
                    allStus = text.components(separatedBy: "/*/")
                    allStus.sort()
                } else if text != "" {
                    allStus.append(text)
                }
                
                for stu in allStus {
                    allPregs.append(Prereg(info: stu))
                }
                print( allStus)
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
        return allPregs
    }//DONE
    
    //prereg mail topla
    func getPreregMails(no: Int) -> String {
        var mails = ""
        var allStus = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("PreregistrationDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/"){
                    allStus = text.components(separatedBy: "/*/")
                    allStus.sort()
                } else if text != "" {
                    allStus.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
        
        for stu in allStus {
            let array = stu.components(separatedBy: "//")
            if no == 0 {
            mails += array[3]
            }
            else {
                let filtre = array[1]
                if no == 1 && filtre == "Modern"{
                    mails += array[3]
                } else if no == 2 && filtre == "Hiphop"{
                    mails += array[3]
                } else if no == 3 && filtre == "Düğün Dansı"{
                    mails += array[3]
                } else if no == 4 && filtre == "Tap Dans"{
                    mails += array[3]
                } else if no == 5 && filtre == "Özel Ders"{
                    mails += array[3]
                } else if no == 6 && filtre == "Latin"{
                    mails += array[3]
                } else if no == 7 && filtre == "Diğer"{
                    mails += array[3]
                } else if no == 8 && filtre == "Çocuk"{
                    mails += array[3]
                }
            }
        }
        return mails
    }
    
    //CLASS SHHİİTT000000000000000000000000000000000000000000000000000000000000000
    //adds new class info to class details
    func createNewClass(infos: [String]) {
        var newStr: String = " "
        var info = infos
        
        if info[4] == "1" {
            addToComboList(name: info[0], group: 2)
        } else {
            addToComboList(name: info[0], group: 3)
        }
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" {
                    newStr = text + "/*/"
                } else {
                    newStr = ""
                }
            }
            catch let error as NSError {
                print("ERROR:")
                print( error)
            }
            
            if newStr != " " {
                //ders saatlerini HH:mm formatında yaz
                let times = info[5].components(separatedBy: ":00 ")
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
                print(saat)
                info[5] = String(saat)
                let day = infos[5].components(separatedBy: "//")[0]
                info.insert( day, at: 5)
                let addition = info.joined(separator: "//")
                print(addition)
                newStr = newStr + addition
                print("Newstr: " + newStr)
                //writing the new version
                do {
                    try newStr.write(to: fileURL, atomically: true, encoding: .utf8)
                } catch {
                    print(error)
                    print("ClassDetails e yazamıyo")
                }
            }
        }
        //created classes' file for devamlılık tablosu
        newStr = "1"
        let dir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = dir.appendingPathComponent( toFileName(name: info[0])).appendingPathExtension("txt")
        
        do {
            try newStr.write(to: fileUrl, atomically: true, encoding: .utf8)
            print(newStr)
        } catch {
            print(error)
        }
    }//DONE
    
    //read th infos of the wanted class for class details page
/* class info by order: name, instructor, cost, comments, isTeknik, timetable*/
    func readClassDetail(className: String) -> [String] {
        var classInfo: [String] = []
        var allClasses: [String] = []
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    allClasses = text.components(separatedBy: "/*/")
                } else if text != "" {
                    allClasses.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            //searching for student
            for clas in allClasses {
                if className == clas.components(separatedBy: "//")[0] {
                    classInfo = clas.components(separatedBy: "//")
                    return classInfo
                }
            }
        }
        return ["Class NOT Found"]
    }//DONE
    
    //derslerin listesi
    //liste sırası: name, ücret, instructor, katılan öğrenci sayısı
    func allClassesTable() -> [Ders] {
        var stuInfo: String = ""
        var allStus: [String] = []
        var tableInfos = [Ders]()
        var stuDeets = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/"){
                    allStus = text.components(separatedBy: "/*/")
                } else if text != "" {
                    allStus.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            if allStus.count > 0 {
                //tüm derslerin bilgilerini almak
                for stu in allStus {
                    stuDeets = stu.components(separatedBy: "//")
                    stuInfo = stuDeets[0] + "//" + stuDeets[2] + "//" + stuDeets[1] + "//" + stuDeets[stuDeets.count-2]
                    tableInfos.append(Ders(info: stuInfo))
                }
            }
        }
        return tableInfos
    }//DONE
    
    //delete class
    func deleteClass(name: String) {
        var lastStus: String = ""
        var allStus: [String] = []
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/"){
                    allStus = text.components(separatedBy: "/*/")
                } else if text != "" {
                    allStus.append(text)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            //searching for student and exclude it in new string
            for stu in allStus {
                if !(name == stu.components(separatedBy: "//")[0]) {
                    lastStus += stu + "/*/"
                }
                //DELETING FROM COMBO LIST
                else {
                    if stu.components(separatedBy: "//")[4] == "1" {
                        deleteInComboList(name: name, group: 2)
                    } else {
                        deleteInComboList(name: name, group: 3)
                    }
                }
            }
            
            //write new string to file
            do {
                try lastStus.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
        //delete devamsızlık tablosu
        if let dir2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir2.appendingPathComponent(toFileName(name: name)).appendingPathExtension("txt")
            do {
                try FileManager().removeItem(atPath: fileURL.path)
            } catch {
                print(error)
            }
        }
    }//DONE
    
    //returns table's infos in an array seperated by rows
    //columns separed in string with /
    func getClassAbsence(name: String, choice: String) -> [SosyalDevamsızlık] {
        var ay = choice
        var perRow = [String]()
        var table = [SosyalDevamsızlık]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(toFileName(name: name)).appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text.contains("/*/") {
                    let perAy = text.components(separatedBy: "/*/")
                    if ay == "current" {
                        ay = String(perAy.count)
                    }
                    for month in perAy {
                        if month != "" && month.components(separatedBy: "//")[0] == ay {
                            perRow = month.components(separatedBy: "//")
                            perRow.remove(at: 0)
                            break
                        }
                    }
                } else {
                    perRow = text.components(separatedBy: "//")
                    perRow.remove(at: 0)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
        for row in perRow {
            table.append( SosyalDevamsızlık(info: row))
        }
        return table
    }
    
    //returns table's infos in an array seperated by rows
    //columns separed in string with /
    func getTeknikClassAbsence(name: String, choice: String) -> [TeknikDevamsızlık] {
        var perRow = [String]()
        var table = [TeknikDevamsızlık]()
        var ay = choice
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(toFileName(name: name)).appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text.contains("/*/") {
                    let perAy = text.components(separatedBy: "/*/")
                    if ay == "current" {
                        ay = String(perAy.count)
                    }
                    for month in perAy {
                        if month != "" && month.components(separatedBy: "//")[0] == ay {
                            perRow = month.components(separatedBy: "//")
                            perRow.remove(at: 0)
                            break
                        }
                    }
                } else {
                    perRow = text.components(separatedBy: "//")
                    perRow.remove(at: 0)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
        for row in perRow {
            table.append( TeknikDevamsızlık(info: row))
        }
        return table
    }
    
    func getNumOfStudents(name: String) -> String {
        var perRow = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( "ClassDetails" ).appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                for month in text.components(separatedBy: "/*/") {
                    if month != "" && month.components(separatedBy: "//")[0] == name {
                        perRow = month.components(separatedBy: "//")
                        return perRow[perRow.count - 2]
                    }
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
        return "error in get num of stus"
    }//DONE
    
    func addToClass(studentName: String, name: String) {
        var perRow = [String]()
        var newText = ""
        var final = ""
        var dersString = "/-/-/-/-/"
        
        //increase og_sayısı and get isTeknik
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("ClassDetails" ).appendingPathExtension("txt")
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    var allAylar = text.components(separatedBy: "/*/")
                    var index = 0; var i = 0
                    for month in allAylar {
                        if month != "" && month.components(separatedBy: "//")[0] == name {
                            perRow = month.components(separatedBy: "//")
                            let sayı = Int(perRow[8]) ?? 0
                            perRow.remove(at: 8)
                            perRow.insert(String(sayı + 1), at: 8)
                            newText = perRow.joined(separator: "//")
                            index =  i
                            
                            //isTeknik check
                            if perRow[4] == "1" {
                                dersString = "/-/-/-/-/-/-/-/-/"
                            }
                            break
                        }
                        i += 1
                    }
                    allAylar.remove(at: index)
                    allAylar.insert(newText,at: index)
                    final = allAylar.joined(separator: "/*/")
                } else if text != "" {
                    perRow = text.components(separatedBy: "//")
                    let sayı = Int(perRow[8]) ?? 0
                    perRow.remove(at: 8)
                    perRow.insert(String(sayı + 1), at: 8)
                    
                    //isTeknik check
                    if perRow[4] == "1" {
                        dersString = "/-/-/-/-/-/-/-/-/"
                    }
                    final = perRow.joined(separator: "//")
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
        
        //add to class absense
        if let dir1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL1 = dir1.appendingPathComponent( toFileName(name: name) ).appendingPathExtension("txt")
            
            //reading old version and writing the new
            do {
                let text = try String(contentsOf: fileURL1, encoding: .utf8)
                
                final = text + "//" + studentName + dersString + getPayStatus(name: name) + "/ "
                do {
                    try final.write(to: fileURL1, atomically: true, encoding: .utf8)
                } catch {
                    print(error)
                }
            }
            catch let error as NSError {
                print("ERROR")
                print( error)
            }
        }
    }//DONE
    
    //new month update class detail
    func updateClassMonth(name: String) {
        var final = ""
        var isTeknik = false
        
        //is it teknik?
        for ders in getComboBoxData(group: 2) {
            if ders == name {
                isTeknik = true
            }
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( toFileName(name: name) ).appendingPathExtension("txt")
            
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                var perAy = text.components(separatedBy: "/*/")
                final = text + "/*/" + String(perAy.count + 1) + "//"
                perAy = final.components(separatedBy: "/*/")
                
                
                var stus = perAy[ perAy.count - 2].components(separatedBy: "//")
                stus.remove(at: 0)
                var newStus = [String]()
                for stu in stus {
                    var this = stu.components(separatedBy: "/")[0] + "/"
                    if isTeknik {
                        this += "-/-/-/-/-/-/-/-/ / "
                    } else {
                        this += "-/-/-/-/ / "
                    }
                    newStus.append(this)
                }
                final += newStus.joined(separator: "//")
            } catch {
                print(error)
            }
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
        // update sıradaki ödeme tarihi
        if let dir2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir2.appendingPathComponent("ClassDetails").appendingPathExtension("txt")
            var final = ""
            //reading old version
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                var allClasses = text.components(separatedBy: "/*/")
                var i = 0; var index = 0; var new = ""
                for ders in allClasses {
                    var dersComp = ders.components(separatedBy: "//")
                    if dersComp[0] == name {
                        let sot = nextDate(oldDate: dersComp[9])
                        index = i
                        dersComp.removeLast()
                        dersComp.append(sot)
                        new = dersComp.joined(separator: "//")
                    }
                    i += 1
                }
                allClasses.remove(at: index)
                allClasses.insert(new, at: index)
                final = allClasses.joined(separator: "/*/")
            }
            catch let error as NSError {
                print("ERROR at updateSÖT:")
                print( error)
            }
            do {
                try final.write( to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    func deleteFromClass(stuName: String, className: String) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( toFileName(name: className) ).appendingPathExtension("txt")
            var final = ""
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                var allAys = text.components(separatedBy: "/*/")
                var lastMonth = allAys[allAys.count - 1].components(separatedBy: "//")
                let ayAdı = lastMonth.removeFirst() //ilkinde sadece ayın tarihi var
                var i = 0; var index = 0
                for stu in lastMonth {
                    if stu.components(separatedBy: "/")[0] == stuName {
                        index = i
                    }
                    i += 1
                }
                lastMonth.remove(at: index)
                let sonAy = ayAdı + "//" + lastMonth.joined(separator: "//")
                allAys.append( sonAy)
                final = allAys.joined(separator: "/*/")
            } catch {
                print(error)
            }
            
            do {
                try final.write( to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    func setClassTable(className: String, newRowValue: String, index: Int, level: String) {
        var perAy = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( toFileName(name: className) ).appendingPathExtension("txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    perAy = text.components(separatedBy: "/*/")
                } else if text != "" {
                    perAy.append(text)
                }
            } catch {
                print(error)
            }
            let month = (Int(level) ?? 1) - 1
            var currentMonth = perAy[month].components(separatedBy: "//")
            currentMonth.insert(newRowValue, at: index + 1 )
            currentMonth.remove(at: index + 2)
            
            perAy.remove(at: month)
            perAy.insert(currentMonth.joined(separator: "//"), at: month)
            let final = perAy.joined(separator: "/*/")
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    //dersin sahip olduğu level sayısını returnlücek
    func getClassLevel(className: String) -> [String] {
        var perAy = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( toFileName(name: className) ).appendingPathExtension("txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    perAy = text.components(separatedBy: "/*/")
                } else if text != "" {
                    perAy.append(text)
                }
            } catch {
                print(error)
            }
        }
        var list = [String]()
        for i in 1..<(perAy.count + 1)  {
            list.append(String(i))
        }
        return list
    }
    
    //öğrencinin ödeme tablosuna değişiklik kaydetme
    func setPaymentRow(stuName: String, newRowValue: String, index: Int) {
        var perAy = [String]()
        var final = ""
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( toFileName(name: stuName) ).appendingPathExtension("txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if index == -1 {
                    final = text + "/*/" + newRowValue
                }
                else {
                    if text != "" && text.contains("/*/") {
                        perAy = text.components(separatedBy: "/*/")
                    } else if text != "" {
                        perAy.append(text)
                    }
                    
                    perAy.remove(at: index )
                    perAy.insert(newRowValue, at: index)
                    final = perAy.joined(separator: "/*/")
                }
                
            } catch {
                print(error)
            }
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    //save the whole payment table
    func setPaymentTable(stuName: String, newValues: [Payment]) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( toFileName(name: stuName) ).appendingPathExtension("txt")
            
            var currentMonth = [String]()
            for i in 0..<(newValues.count) {
                currentMonth.append(newValues[i].donem + "//" + newValues[i].ders + "//" + String(newValues[i].miktar) + "//" + newValues[i].yorum )
            }
            let final = currentMonth.joined(separator: "/*/")
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    func getPaymentTable(stuName: String) -> [Payment] {
        var perAy = [String]()
        var table = [Payment]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent( toFileName(name: stuName) ).appendingPathExtension("txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                if text != "" && text.contains("/*/") {
                    perAy = text.components(separatedBy: "/*/")
                } else if text != "" {
                    perAy.append(text)
                }
            } catch {
                print(error)
            }
            for donem in perAy {
                table.append( Payment(info: donem))
            }
        }
        return table
    }
    
    //KASAAAA0000000000000000000000000000000000000000000000000000000000000000000000000000000
    func getÖdemeler(date: String) -> String {
        var text: String = ""
        var zaman = date
        var miktar = ""
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("LeKasaGelir" ).appendingPathExtension("txt")
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            } catch {
                print(error)
            }
            if date == "current" {
                zaman = getCurrentDate()
            }
            
            var ay = 0
            var i = 0
            for month in text.components(separatedBy: "/*/"){
                if month.components(separatedBy: "//")[0] == zaman {
                    ay = i
                }
                i += 1
            }
            let odemeler = text.components(separatedBy: "/*/")[ay].components(separatedBy: "//")[1]
            miktar = odemeler.components(separatedBy: "/")[1]
        }
        return miktar
    }
    
    func getKasaGelir(date: String) -> [KasaGelir] {
        var tableInfos = [KasaGelir]()
        var text: String = ""
        var zaman = date
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("LeKasaGelir" ).appendingPathExtension("txt")
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            } catch {
                print(error)
            }
            if date == "current" {
                zaman = getCurrentDate()
            }
            
            var ay = 0
            var i = 0
            for month in text.components(separatedBy: "/*/"){
                if month.components(separatedBy: "//")[0] == zaman {
                    ay = i
                }
                i += 1
            }
            
            var wantedAy = text.components(separatedBy: "/*/")[ay].components(separatedBy: "//")
            wantedAy.remove(at: 0)
            //searching for student
            for kasa in wantedAy {
                let gelir = kasa.components(separatedBy: "/")[0]
                let miktar = kasa.components(separatedBy: "/")[1]
                tableInfos.append(KasaGelir(giris: gelir, girMiktar: miktar) )
            }
        }
        return tableInfos
    }
    
    //setter
    func setKasaGelir(newValues: [KasaGelir], date: String) {
        var perAy = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("LeKasaGelir" ).appendingPathExtension("txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                perAy = text.components(separatedBy: "/*/")
            } catch {
                print(error)
            }
            
            var i = 0
            var month = 0
            for ay in perAy {
                if ay.components(separatedBy:"//")[0] == date {
                    month = i
                }
                i += 1
            }
            var currentMonth = [String]()
            currentMonth.append(date)
            for i in 0..<(newValues.count) {
                currentMonth.append(newValues[i].giris + "/" + newValues[i].girMiktar )
            }
            perAy.remove(at: month)
            perAy.insert(currentMonth.joined(separator: "//"), at: month)
            
            let final = perAy.joined(separator: "/*/")
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    func setÖdemeler(newRowValue: String, date: String) {
        var perAy = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("LeKasaGelir" ).appendingPathExtension("txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                perAy = text.components(separatedBy: "/*/")
            } catch {
                print(error)
            }
            
            var i = 0
            var month = 0
            for ay in perAy {
                if ay.components(separatedBy:"//")[0] == date {
                    month = i
                }
                i += 1
            }
            var currentMonth = perAy[month].components(separatedBy: "//")
            currentMonth.remove(at: 1)
            currentMonth.insert(newRowValue, at: 1)
            
            perAy.remove(at: month)
            perAy.insert(currentMonth.joined(separator: "//"), at: month)
            
            let final = perAy.joined(separator: "/*/")
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    //KASA GİDER İÇİN
    func getKasaGider(date: String) -> [KasaGider] {
        var tableInfos = [KasaGider]()
        var text: String = ""
        var zaman = date
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("LeKasaGider" ).appendingPathExtension("txt")
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            } catch {
                print(error)
            }
            if date == "current" {
                zaman = getCurrentDate()
            }
            var ay = 0
            var i = 0
            for month in text.components(separatedBy: "/*/"){
                if month.components(separatedBy: "//")[0] == zaman {
                    ay = i
                }
                i += 1
            }
            var wantedAy = text.components(separatedBy: "/*/")[ay].components(separatedBy: "//")
            wantedAy.remove(at: 0)
            //searching for student
            for kasa in wantedAy {
                let giden = kasa.components(separatedBy: "/")[0]
                let miktar = kasa.components(separatedBy: "/")[1]
                tableInfos.append(KasaGider(giden: giden, gitMiktar: miktar) )
            }
        }
        return tableInfos
    }
    //setter
    //her aydaki değerler değişir
    func setKasaGider(newValues: [KasaGider], date: String) {
        var perAy = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("LeKasaGider" ).appendingPathExtension("txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                perAy = text.components(separatedBy: "/*/")
            } catch {
                print(error)
            }
            
            var i = 0
            var month = 0
            for ay in perAy {
                if ay.components(separatedBy:"//")[0] == date {
                    month = i
                }
                i += 1
            }
            var currentMonth = [String]()
            currentMonth.append(date)
            for i in 0..<(newValues.count) {
                currentMonth.append(newValues[i].giden + "/" + newValues[i].gitMiktar )
            }
            perAy.remove(at: month)
            perAy.insert(currentMonth.joined(separator: "//"), at: month)
            
            let final = perAy.joined(separator: "/*/")
            
            do {
                try final.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    
    //SEZONSAL KAASA000000000000000000000000000000000000000000000000000000000000000000000000
    func getSezonKasa() -> [Sezon] {
        var tableInfos = [Sezon]()
        var text: String = ""
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("SezonsalKasa" ).appendingPathExtension("txt")
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            } catch {
                print(error)
            }
            var aylar = [String]()
            var giris = 0.0
            var giden = 0.0
            var ad = ""
            for sezon in text.components(separatedBy: "/*/") {
                aylar = sezon.components(separatedBy: "//")
                ad = aylar[0]
                aylar.remove(at: 0)
                for ays in aylar {
                    let ay = ays.components(separatedBy: "/")
                    giris += Double( ay[1] ) ?? 0.0
                    giden += Double( ay[2] ) ?? 0.0
                }
                tableInfos.append( Sezon(name: ad, giris: giris, giden: giden) )
                giris = 0.0; giden = 0.0
            }
        }
        return tableInfos
    }
    
    /*setting info
    @param date : mm.yyyy
 @param info: giris/giden
 */
    func setSezonInfo(date: String,info: String) {
        var text: String = ""
        var aylar = [String]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent("SezonsalKasa" ).appendingPathExtension("txt")
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            } catch {
                print(error)
            }
            var sezonlar = text.components(separatedBy: "/*/")
            var i = 0; var sez = 0
            var j = 1; var month = 1
            for sezon in sezonlar {
                j = 1
                aylar = sezon.components(separatedBy: "//")
                aylar.remove(at: 0)
                for ays in aylar {
                    let ay = ays.components(separatedBy: "/")
                    if ay[0] == date {
                        sez = i
                        month = j
                        break
                    }
                    j += 1
                }
                i += 1
            }
            var per = sezonlar[sez].components(separatedBy: "//")
            per.remove(at: month)
            per.insert(date + "/" + info,at: month)
            
            sezonlar.remove(at: sez)
            sezonlar.insert( per.joined(separator: "//"), at: sez)
            text = sezonlar.joined(separator: "/*/")
            
            do {
                try text.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }
        }
    }
    //EXTRAAAAAAAA00000000000000000000000000000000000000000000000000000000000000000000000000
    
    //name to class name
    func toFileName(name: String) -> String {
        let array = name.components(separatedBy: " ")
        let newName =  array.joined(separator: "")
        return newName
    }
    
    //returns date in mm.yyyy format
    func getCurrentDate() -> String{
        let date = Date()
        let cal = Calendar.current
        let ay = cal.component(.month, from: date)
        let yıl = cal.component(.year, from: date)
        
        return String(ay) + "." + String(yıl)
    }
    
    //returns date in dd.mm.yyyy format
    func getCurrentDay() -> String{
        let date = Date()
        let cal = Calendar.current
        let day = cal.component(.day,from: date)
        let ay = cal.component(.month, from: date)
        let yıl = cal.component(.year, from: date)
        
        return String(day) + "." + String(ay) + "." + String(yıl)
    }
    
    func nextDate( oldDate: String) -> String {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        let dateOld: Date = df.date(from: oldDate)!
        let newDate: Date = Calendar.current.date(byAdding: .day, value: 28, to: dateOld)!
        let dateStr: String = df.string(from: newDate)
        return dateStr
    }
}
