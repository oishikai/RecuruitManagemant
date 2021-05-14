//
//  Access.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/14.
//

import UIKit
import CoreData

class AccessData: UIViewController {
        
    static func getCompanies() ->[Company]? {
        var companies:[Company] = []
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        do{
            companies = try managedObjectContext.fetch(dataCondition) as! [Company]
            return companies
        }catch{
            print("エラーだよ")
        }
        return nil
    }
}
