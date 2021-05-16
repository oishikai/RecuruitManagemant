//
//  AddEventViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/15.
//

import UIKit
import CoreData

class AddEventViewController: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var addNewEventButton: UIButton!
    
    static let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var events:NSSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "イベントを追加する"

        eventName.delegate = self
    }
    
    @IBAction func addNewEventButton(_ sender: Any) {
        guard !(eventName.text?.isEmpty ?? true) else {
            print("Name is Empty or nil")
            return
        }
        
    }
    public func addToEvent(_ value: Event) {
        
    }

}
