//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/13.
//

import UIKit
import CoreData

class AddCompanyViewController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var companyNameField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    
    var companies:[Company] = []
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "企業を追加する"
        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
            do{
              companies = try managedObjectContext.fetch(dataCondition) as! [Company]
            }catch{
              print("エラーだよ")
            }
    }
    
    @IBAction func AddCompanyButton(_ sender: Any) {
        let newCompany = Company(context: self.managedObjectContext)
        newCompany.companyName = companyNameField.text
        self.companies.append(newCompany)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
