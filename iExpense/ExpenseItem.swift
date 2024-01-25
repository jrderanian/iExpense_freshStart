//
//  ExpenseItem.swift
//  iExpense
//
//  Created by John Deranian on 1/15/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: expenseType
    let amount: Double
    var amountCategory: valueCategory {
        if (amount < 11) {
            return .small
        }
        if (amount < 101) {
            return .medium
        }
        return .large
    }
    
    static let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    static let expenseSample = ExpenseItem(id: UUID(), name: "Ferrarri", type: .Personal, amount: 125_000)
}

enum valueCategory: String, Codable {
    case small
    case medium
    case large
}

// https://sarunw.com/posts/swiftui-picker-enum/ to get this to work in picker
enum expenseType: String, Codable, CaseIterable, Identifiable {
    
    case Personal
    case Business
    
    var id: Self { self }
    
}

