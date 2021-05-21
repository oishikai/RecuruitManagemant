//
//  EventListTableViewCell.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/20.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var dateIcon: UIImageView!
    @IBOutlet weak var locateIcon: UIImageView!
    @IBOutlet weak var memoIcon: UIImageView!
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventLocateLabel: UILabel!
    
    @IBOutlet weak var eventMemoField: UITextView!
    static var formatt = "MM月dd日HH時mm分"
    static let cellIdentifier = String(describing: EventListTableViewCell.self)
    let star = UIImage(named: "AspirationStar")
    
    func setup(event:Event) {
        eventNameLabel.text = event.eventName
        let strDate = stringFromDate(date: event.eventDate!, format: "MM/dd HH:mm")
        eventDateLabel.text = strDate
        eventLocateLabel.text = event.eventLocate
        eventIcon.image = star
        dateIcon.image = star

    }
    
    func stringFromDate(date: Date, format: String) -> String {
            let formatter: DateFormatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = format
            return formatter.string(from: date)
        }
}
