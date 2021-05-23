//
//  UpdateEventViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/23.
//

import UIKit
import Eureka

class UpdateEventViewController: FormViewController {
    
    var event:Event = Event()
    var company:Company!
    
    var eventType:EventType?
    var eventDate:Date?
    var eventLocate:String?
    var eventMemo:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "イベント情報を更新"
        form +++ Section("イベントの情報")
            
            <<< PushRow<String> {
                $0.title = "イベント内容 ( \(EventType(rawValue: event.eventType)!.name) に設定中 )"
                $0.options = EventType.allCases.compactMap({$0.name})
            }.onChange() { row in
                guard let value = row.value, let eventType = EventType.getEventType(name: value) else { return }
                self.eventType = eventType
            }
            <<< DateTimeInlineRow(){
                let strDate = stringFromDate(date: event.eventDate!, format: "MM/dd HH:mm")
                $0.title = "日時 ( \(strDate) に設定中 )"
            }.onChange() { row in
                self.eventDate = row.value!
            }
            
            <<< TextRow(){ row in
                row.title = "場所"
                row.placeholder = "\(event.eventLocate!)"
            }.onChange() { row in
                if let locate = row.value {
                    self.eventLocate = locate
                }
            }
            +++ Section("メモ")
            
            <<< TextAreaRow(){ row in
                row.placeholder = "詳細を入力する"
            }.onChange() { row in
                if let memo = row.value {
                    self.eventMemo = memo
                }
            }
            
            +++ Section("イベントの更新を確定する")
            <<< ButtonRow("フォームを送信") {row in
                row.title = "イベント情報更新"
                row.onCellSelection{[unowned self] ButtonCellOf, row in
                    if AccessData.canUnwrapDatas(dataArray: [eventLocate]) {
                        AccessData.saveNewEvent(company: company, type: eventType!, date: eventDate!, locate: eventLocate!, memo: eventMemo)
                        DispatchQueue.main.async {
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
    }
    
    func stringFromDate(date: Date, format: String) -> String {
            let formatter: DateFormatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = format
            return formatter.string(from: date)
        }
}

