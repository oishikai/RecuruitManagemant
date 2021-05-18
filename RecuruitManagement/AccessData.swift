//
//  Access.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/14.
//

import UIKit
import CoreData

class AccessData: UIViewController {
        
    static let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    static func getCompanies() ->[Company]? {
        var companies:[Company] = []
        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        do{
            companies = try managedObjectContext.fetch(dataCondition) as! [Company]
            return companies
        }catch{
            print("エラーだよ")
        }
        return nil
    }
    
    static func canUnwrapDatas(attitude: String? ...) -> Bool {
        for i in 0...(attitude.count - 1) {
            guard !(attitude[i]?.isEmpty ?? true) else {
                print("Empty or nil ->\(i)")
                return false
            }
        }
        return true
    }
    
    static func saveNewCompany(name: String, url: URL, aspiration: String) -> Void {
        var companies:[Company] = []
        let comp = AccessData.getCompanies()
        guard comp != nil else {
            print("accessError")
            return
        }
        companies = comp!
        
        let newCompany = Company(context: self.managedObjectContext)
        newCompany.companyName = name
        newCompany.url = url
        newCompany.aspiration = aspiration
        companies.append(newCompany)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    static func saveNewEvent(name: String, date:Date, locate:String) -> Void {
        let newEvent = Event(context: self.managedObjectContext)
        newEvent.eventName = name
        newEvent.eventLocate = locate
        newEvent.eventDate = date
    }
}
