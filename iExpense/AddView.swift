//
//  AddView.swift
//  iExpense
//
//  Created by John Deranian on 1/15/24.
//

import Foundation
import SwiftUI

struct AddView: View {
    @State private var name = "New Expense"
    @State private var type: expenseType = .Personal
    @State private var amount = 0.0
    var expenses: Expenses
    @Environment(\.dismiss) private var dismiss

    //let types = ["Business", "Personal"]
    
    enum FocusedField {
        case expenseName, expenseAmount
    }
    
    @FocusState private var focusedField: FocusedField?

    var body: some View {
       // NavigationStack {
            Form {
//                TextField("Name", text: $name)
//                    .focused($focusedField, equals: .expenseName)

                Picker("Type", selection: $type) {
                    ForEach(expenseType.allCases) { type in
                        Text(String(describing: type))
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: ExpenseItem.localCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarBackButtonHidden()
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: expenseType(rawValue: type.rawValue) ?? .Personal, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .onAppear {
                focusedField = .expenseName
            }
        //}
    }
}

#Preview {
    AddView(expenses: Expenses())
}
