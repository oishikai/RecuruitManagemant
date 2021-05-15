//
//  EventListViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/15.
//

import UIKit

class EventListViewController: UIViewController{

    @IBOutlet weak var eventTable: UITableView!
    var addBarButtonItem: UIBarButtonItem!

    var list = ["一次面接", "書類選考"]
    
    var events:NSSet? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]
    }
    
    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "AddCompanyViewController", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "AddCompanyViewController")as! AddCompanyViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
}
