//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/18.
//

import UIKit
import Eureka

class EventFormViewController: FormViewController{
    
    var eventName:String?
    var eventData:Date?
    var eventLocate:String?
    var eventMemo:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("イベントの情報を入力してください。")
            <<< PushRow<String> {
                $0.title = "イベント内容"
                $0.options = ["会社説明会","座談会","筆記試験","適正検査","実技課題","プレゼン発表","グループワーク","グループディスカッション","集団面接","面接","最終面接"]
            }.onChange() { row in
                self.eventName = row.value!
            }
            
            <<< DateTimeInlineRow(){
                $0.title = "日時"
            }.onChange() { row in
                self.eventData = row.value!
            }
            
            <<< TextRow(){ row in
                row.title = "場所"
                row.placeholder = ""
            }.onChange() { row in
                if let locate = row.value{
                    
                }
            }
            +++ Section("備考(持ち物等)")
            <<< TextAreaRow(){ row in
                row.placeholder = "詳細を入力する"
            }
            +++ Section("イベントの追加を確定する")
            <<< ButtonRow("フォームを送信") {row in
                row.title = "送信する"
                row.onCellSelection{[unowned self] ButtonCellOf, row in
//                    AccessData.canUnwrapDatas(attitude: eventName,eventLocate,eventBelongings)
                }
            }
    }
}
