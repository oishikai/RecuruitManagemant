//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/04/30.
//

import UIKit

class RecuruitListViewController: UIViewController {
    
    @IBOutlet weak var companyTableView: UITableView!
    var addBarButtonItem: UIBarButtonItem!

    private var companies:[Company] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "企業一覧"
        
        addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]
        
        let comp = AccessData.getCompanies()
        guard comp != nil else {
            print("accessError")
            return
        }
        companies = comp!
        
        let nib = UINib(nibName: RecuruitListTableViewCell.cellIdentifier, bundle: nil)
        companyTableView.register(nib, forCellReuseIdentifier: RecuruitListTableViewCell.cellIdentifier)
        companyTableView.rowHeight = UITableView.automaticDimension

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let comp = AccessData.getCompanies()
        guard comp != nil else {
            print("accessError")
            return
        }
        companies = comp!
        companyTableView.reloadData()
    }
    
    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "NewCompanyFormViewController", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "NewCompanyFormViewController")as! NewCompanyFormViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension RecuruitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecuruitListTableViewCell.cellIdentifier, for: indexPath) as! RecuruitListTableViewCell
        cell.setup(company: companies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "EventListViewController", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "EventListViewController")as! EventListViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.title = self.companies[indexPath.row].companyName
            nextVC.company = self.companies[indexPath.row]
        }
    }

}
