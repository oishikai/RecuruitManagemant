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
    @IBOutlet weak var aspirationField: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    let list = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "企業を追加する"
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 20, width: view.frame.size.width, height: 44))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.done))
        let toolbarbuttongap = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([toolbarbuttongap, doneItem], animated: true)
        
        self.aspirationField.inputView = pickerView
        self.aspirationField.inputAccessoryView = toolbar
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

extension AddCompanyViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return list[row]
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.aspirationField.text = list[row]
        }
    
    @objc func done() {
            self.aspirationField.endEditing(true)
        }
    
}
