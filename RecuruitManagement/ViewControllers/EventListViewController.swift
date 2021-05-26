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
        if events.count > 0 {
            sortedEvents = events.sorted(by: { (a, b) -> Bool in
                    return a.eventDate! > b.eventDate!
                })
        }else{
            self.sortedEvents = events
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let events = company.event?.allObjects as! [Event]
        if events.count > 0 {
            sortedEvents = events.sorted(by: { (a, b) -> Bool in
                    return a.eventDate! > b.eventDate!
                })
        }else{
            self.sortedEvents = events
        }
        eventTable.reloadData()
        if company.selectionStatus == 0 {
            let actionSheet = UIAlertController(title: "\(company.companyName!)の選考状況を変更しますか？", message: "", preferredStyle: UIAlertController.Style.actionSheet)

            // 表示させたいタイトル1ボタンが押された時の処理をクロージャ実装する
            let action1 = UIAlertAction(title: SelectStatus(rawValue: 1)!.name, style: UIAlertAction.Style.default, handler: {
                (action: UIAlertAction!) in
                self.company.selectionStatus = 1
            })
            // 表示させたいタイトル2ボタンが押された時の処理をクロージャ実装する
            let action2 = UIAlertAction(title: SelectStatus(rawValue: 2)!.name, style: UIAlertAction.Style.default, handler: {
                (action: UIAlertAction!) in
                self.company.selectionStatus = 2
            })
            
            let close = UIAlertAction(title: "変更しない", style: UIAlertAction.Style.destructive, handler: {
                (action: UIAlertAction!) in
            })

            //UIAlertControllerにタイトル1ボタンとタイトル2ボタンと閉じるボタンをActionを追加
            actionSheet.addAction(action1)
            actionSheet.addAction(action2)
            actionSheet.addAction(close)
            //実際にAlertを表示する
            self.present(actionSheet, animated: true, completion: nil)
        }
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
        let event = sortedEvents[indexPath.row]
        cell.setup(event: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "UpdateEventViewController", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "UpdateEventViewController")as! UpdateEventViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.event = self.sortedEvents[indexPath.row]
            nextVC.company = self.company
        }
    }
}
