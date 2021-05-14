//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/13.
//

import UIKit

class AddCompanyViewController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var companyNameField: UITextField!
    @IBOutlet weak var urlField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "企業を追加する"
    }
    
    @IBAction func AddCompanyButton(_ sender: Any) {
        guard !(companyNameField.text?.isEmpty ?? true) else {
            print("Name is Empty")
            return
        }
        
        guard !(urlField.text?.isEmpty ?? true) else {
            print("URL is Empty")
            return
        }
        
        let companyURL = URL(string: urlField.text!)!
        
        AccessData.saveNewCompany(name: companyNameField.text!, url: companyURL)
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
