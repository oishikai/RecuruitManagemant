//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/04/30.
//

import UIKit
import CoreData

class RecuruitListViewController: UIViewController {
    
    @IBOutlet weak var companyTableView: UITableView!
    var addBarButtonItem: UIBarButtonItem!

    var companies:[Company] = []
    
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "企業一覧"
        addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]
        
        let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
            do{
              companies = try managedObjectContext.fetch(dataCondition) as! [Company]
            }catch{
              print("error")
            }
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let dataCondition = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
            do{
              companies = try managedObjectContext.fetch(dataCondition) as! [Company]
            }catch{
              print("error")
            }
            companyTableView.reloadData()
        }
    
    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "AddCompanyViewController", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "AddCompanyViewController")as! AddCompanyViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension RecuruitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let data = companies[indexPath.row]
        cell.textLabel?.text = data.companyName
        return cell
    }
}
