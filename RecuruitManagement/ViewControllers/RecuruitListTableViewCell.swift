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
    
    let star = UIImage(named: "AspirationStar")
//    starImage.image = star
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        let star = UIImage(named: "AspirationStar")
//        starImage.image = star
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    func setup(company:Company) {
        companyName.text = company.companyName
        selectionStatus.text = company.selectionStatus
        
        
    }
    
}
