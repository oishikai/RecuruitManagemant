//
//  NewCompanyFormViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/18.
//

import UIKit
import Eureka

class NewCompanyFormViewController: FormViewController {
    
    var companyName:String?
    var companyURL:URL?
    var aspiration:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("会社の情報")
            <<< TextRow(){ row in
                row.title = "企業名"
                row.placeholder = ""
            }.onChange() { row in
                if let name = row.value {
                    self.companyName = name
                }
            }
            
            <<< URLRow(){ row in
                row.title = "URL"
                row.placeholder = ""
            }.onChange() { row in
                if let url = row.value {
                    self.companyURL = url
                }
            }
        
            <<< SegmentedRow<String>() { row in
                            row.title = "志望度"
                            row.options = ["1","2","3","4","5"]
                            }.onChange{[unowned self] row in
                            }
    }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
