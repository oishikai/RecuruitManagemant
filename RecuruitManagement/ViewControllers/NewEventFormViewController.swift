//
//  ViewController.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/18.
//

import UIKit
import Eureka

class NewEventFormViewController: FormViewController {
    
    var eventType:EventType?
    var eventDate:Date?
    var eventLocate:String?
    var eventMemo:String?
    
    var company:Company!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "イベント追加"
        form +++ Section("イベントの情報")
            <<< PushRow<String> {
                $0.title = "イベント内容"
                $0.options = EventType.allCases.compactMap({$0.name})
            }.onChange() { row in
                self.eventType = self.getEventType(name: row.value!)
            }
            
            <<< DateTimeInlineRow(){
                $0.title = "日時"
            }.onChange() { row in
                self.eventDate = row.value!
            }
            
            <<< TextRow(){ row in
                row.title = "場所"
                row.placeholder = ""
            }.onChange() { row in
                if let locate = row.value {
                    self.eventLocate = locate
                }
            }
            +++ Section("メモ")
            
            <<< TextAreaRow(){ row in
                row.placeholder = "詳細を入力する"
            }
            
            +++ Section("イベントの追加を確定する")
            <<< ButtonRow("フォームを送信") {row in
                row.title = "イベント追加"
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
    
    enum EventType: Int16, CaseIterable{
        case informationSession
        case symposium
        case writtenTest
        case aptitudeTest
        case practicaltask
        case presentation
        case groupWork
        case groupDiscussion
        case groupInterview
        case interview
        case finalInterview
        
        var name: String {
            switch self {
            case .informationSession: return "会社説明会"
            case .symposium: return "座談会"
            case .writtenTest: return "筆記試験"
            case .aptitudeTest: return "適正検査"
            case .practicaltask: return "実技課題"
            case .presentation: return "プレゼン発表"
            case .groupWork: return "グループワーク"
            case .groupDiscussion: return "グループディスカッション"
            case .groupInterview: return "集団面接"
            case .interview: return "面接"
            case .finalInterview: return "最終面接"
            }
        }
        
        var image: UIImage{
            switch self {
            case .informationSession:
                return UIImage(named: "Session")!
            case .symposium:
                return UIImage(named: "Symposium")!
            case .writtenTest:
                return UIImage(named: "Test")!
            case .aptitudeTest:
                return UIImage(named: "Test")!
            case .practicaltask:
                return UIImage(named: "Test")!
            case .presentation:
                return UIImage(named: "Session")!
            case .groupWork:
                return UIImage(named: "Discuss")!
            case .groupDiscussion:
                return UIImage(named: "Discuss")!
            case .groupInterview:
                return UIImage(named: "Interview")!
            case .interview:
                return UIImage(named: "Interview")!
            case .finalInterview:
                return UIImage(named: "Interview")!                
            }
        }
    }
    
    func getEventType(name: String) -> EventType? {
        let types = EventType.allCases.compactMap({$0.name})
        if let index = types.firstIndex(of: name) {
            let a = EventType.RawValue.self
            return EventType.allCases[index]
        }
        return nil
    }
}
