//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/04/30.
//

import UIKit
import CoreData

class RecuruitListViewController: UIViewController{
    
    var addBarButtonItem: UIBarButtonItem!      // +ボタン

    var comp = ["A社", "B社", "C社"]
    var companies:[Company] = []
    
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]

        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
            do{
              companies = try managedObjectContext.fetch(dataCondition) as! [Company]
            }catch{
              print("エラーだよ")
            }
    }
    
    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
            print("【+】ボタンが押された!")
        }
}

extension RecuruitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = comp[indexPath.row]
        return cell
    }
}
