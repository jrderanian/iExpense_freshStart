//
//  Expenses.swift
//  iExpense
//
//  Created by John Deranian on 1/16/24.
//

import Foundation

@Observable
class Expenses{
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
            // put into personal array and business array somehow
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
    
    func getItemsByCategory(type: expenseType) -> [ExpenseItem] {
        switch type {
        case .Personal:
            return  items.filter { $0.type == .Personal}
        case .Business:
            return items.filter { $0.type == .Business }
        }
        
    }
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == .Personal }
    }

    var businessItems: [ExpenseItem] {
        items.filter { $0.type == .Business }
    }
}
