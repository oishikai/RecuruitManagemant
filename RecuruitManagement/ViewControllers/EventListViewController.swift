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
    
    var company: Company = Company()
    var events:NSSet?
    var mutableSetEvents:NSMutableSet = NSMutableSet()
    var sortedEvents:[Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]
        
        events = company.event
        mutableSetEvents = NSMutableSet.init(set: events!)
        
        let nib = UINib(nibName: EventListTableViewCell.cellIdentifier, bundle: nil)
        eventTable.register(nib, forCellReuseIdentifier: EventListTableViewCell.cellIdentifier)
        eventTable.rowHeight = UITableView.automaticDimension
        
        let events = company.event?.allObjects as! [Event]
        sortedEvents = events.sorted(by: { (a, b) -> Bool in
                return a.eventDate! > b.eventDate!
            })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventTable.reloadData()
    }

    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "NewEventFormViewController", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "NewEventFormViewController")as! NewEventFormViewController
            nextVC.company = self.company
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company.event?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventListTableViewCell.cellIdentifier, for: indexPath) as! EventListTableViewCell
        cell.setup(event: self.sortedEvents[indexPath.row])
        return cell
    }
}
