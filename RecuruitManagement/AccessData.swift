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
    
//    static func getEvents(company: Company) ->[Event]? {
//        var events:[Event] = []
//        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Event")
//        do{
//            events = try managedObjectContext.fetch(dataCondition) as! [Event]
//            return events
//        }catch{
//            print("エラーだよ")
//        }
//        return nil
//    }
    
    static func canUnwrapDatas(name: String?, url: String?, aspiration: String?) -> Bool {
        guard !(name?.isEmpty ?? true) else {
            print("Name is Empty or nil")
            return false
        }
        guard !(url?.isEmpty ?? true) else {
            print("Name is Empty or nil")
            return false
        }
        guard !(aspiration?.isEmpty ?? true) else {
            print("Name is Empty or nil")
            return false
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
}
