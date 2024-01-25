//
//  ExpenseSectionView.swift
//  iExpense
//
//  Created by John Deranian on 1/17/24.
//

import SwiftUI

struct ExpenseSectionView: View {
    var title: String
    var expenses: [ExpenseItem]
    //var type: expenseType
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        
        Section(header: Text(title)) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text("\(item.type.rawValue)")
                    }
                    Spacer()
                    Text(item.amount, format: .currency(code:ExpenseItem.localCurrency))
                        .style(for: item)
                }
            }.onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseSectionView(title: "Personal", expenses: []) { _ in }
}
