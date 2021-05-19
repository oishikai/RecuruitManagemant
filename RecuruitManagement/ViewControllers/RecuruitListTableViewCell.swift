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
    
    @IBOutlet weak var star1Image: UIImageView!
    @IBOutlet weak var star2Image: UIImageView!
    @IBOutlet weak var star3Image: UIImageView!
    @IBOutlet weak var star4Image: UIImageView!
    @IBOutlet weak var star5Image: UIImageView!
    
    var aspiration:Int = 0
    
    static let cellIdentifier = String(describing: RecuruitListTableViewCell.self)

    let star = UIImage(named: "AspirationStar")

    func setup(company:Company) {
        companyName.text = company.companyName
        selectionStatus.text = company.selectionStatus
        aspiration = Int(string: company.aspiration!) ?? 0
        
        star1Image.image = star
        star2Image.image = star
        star3Image.image = star
        star4Image.image = star
        star5Image.image = star
        
    }
    
}
