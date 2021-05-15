//
//  AddEventViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/15.
//

import UIKit

class AddEventViewController: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var addNewEvent: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "イベントを追加する"

        eventName.delegate = self
    }
    @IBAction func addNewEvent(_ sender: Any) {
    }
}
