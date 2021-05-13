//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/04/30.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var comp = ["A社", "B社", "C社"]
    var companies:[Company] = []
    
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
            do{
              companies = try managedObjectContext.fetch(dataCondition) as! [Company]
            }catch{
              print("エラーだよ")
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = comp[indexPath.row]
        return cell
    }
}

