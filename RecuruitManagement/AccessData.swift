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
    
    static func canUnwrapDatas(dataArray: [String?]) -> Bool {
        return dataArray.filter({$0?.isEmpty ?? true}).count == 0
    }
    
    static func saveNewCompany(name: String, url: String, aspiration: String, status:String) -> Void {
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
        newCompany.selectionStatus = status
        companies.append(newCompany)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    static func saveNewEvent(company:Company, type: NewEventFormViewController.EventType, date:Date, locate:String, memo:String? = nil) -> Void {
        let newEvent = Event(context: self.managedObjectContext)
        newEvent.eventType = type.rawValue
        newEvent.eventLocate = locate
        newEvent.eventDate = date
        if let eventMemo = memo {
            newEvent.eventMemo = eventMemo
        }
        company.addToEvent(newEvent)
    }
    
    static func deleteCompany(company: Company){
        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        let predict = NSPredicate(format: "%K = %@","companyName", company.companyName!)
        dataCondition.predicate = predict
        do {
            let results = try managedObjectContext.fetch(dataCondition)
            for myData in results {
                managedObjectContext.delete(myData as! Company)
                }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }catch{
            
        }
    }
}
