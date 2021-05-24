//
//  SelectStatus.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/24.
//

import Foundation

enum SelectStatus: Int16, CaseIterable {
    
    case wiiApplied
    case applied
    case selection
    
    var name:String {
        switch self {
        case .wiiApplied: return "未エントリー"
        case .applied: return "エントリー済"
        case .selection: return "選考中"
        }
    }
}
