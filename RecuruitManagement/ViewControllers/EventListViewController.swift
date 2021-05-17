//
//  EventListViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/15.
//

import UIKit

class EventListViewController: UIViewController {

    @IBOutlet weak var eventTable: UITableView!
    var addBarButtonItem: UIBarButtonItem!

    var list = ["一次面接", "書類選考"]
    
    var company:Company!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventTable.reloadData()
    }
    
//    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
//        DispatchQueue.main.async {
//            let storyboard = UIStoryboard(name: "AddEventViewController", bundle: nil)
//            let nextVC = storyboard.instantiateViewController(identifier: "AddEventViewController")as! AddEventViewController
//            nextVC.company = self.company
//            self.navigationController?.pushViewController(nextVC, animated: true)
//        }
//    }
    
    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "EventFormViewController", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "EventFormViewController")as! EventFormViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company.event?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let events = company.event?.allObjects as! [Event]
        cell.textLabel?.text = events[indexPath.row].eventName
        return cell
    }
}
