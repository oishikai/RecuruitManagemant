//
//  CompanyListTableViewCell.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/19.
//

import UIKit

class RecuruitListTableViewCell: UITableViewCell {

    @IBOutlet weak var companyIcon: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var selectionStatus: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    
    var aspiration = ""
    static let cellIdentifier = String(describing: RecuruitListTableViewCell.self)

    let star = UIImage(named: "AspirationStar")

    func setup(company:Company) {
        companyName.text = company.companyName
        selectionStatus.text = company.selectionStatus
        aspiration = company.aspiration!
        
    }
    
}
