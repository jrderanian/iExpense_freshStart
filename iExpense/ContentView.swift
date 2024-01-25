//
//  ContentView.swift
//  iExpense
//
//  Created by John Deranian on 1/13/24.
//

import Observation
import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var path = NavigationPath()
    @AppStorage("expenseName") private var title = "Personal"

    enum amountSize {
        case small, medium, large
    }
    @State private var amountCategory: amountSize = .small
    
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSectionView(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                
                ExpenseSectionView(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
            }
            
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink(destination: AddView(expenses: expenses)) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            
            
        }
    }
    
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
    
    
    
    
}

#Preview {
    ContentView()
}

extension View {
    func style(for item: ExpenseItem) -> some View {
        
        switch item.amountCategory {
        case .small:
            return self
                .foregroundColor(.green)
                .font(.body)
        case .medium:
            return self
                .foregroundColor(.yellow)
                .font(.title3)
        case .large:
            return self
                .foregroundColor(.red)
                .font(.title)
        }
    }
}





// Examples for Project 7

//struct User: Codable {
//    let firstName: String
//    let lastName: String
//}
//
//struct ContentView: View {
//
//    @State private var user = User(firstName: "John", lastName: "Deranian")
//
//    var body: some View {
//
//        Button("Save User") {
//            let encoder = JSONEncoder()
//
//            if let data = try? encoder.encode(user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
//
//    }
//}


//struct ContentView: View {
//
//    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//    @AppStorage("tapCount") private var tapCount = 0
//
//    var body: some View {
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//           // UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
//    }
//}

//struct ContentView: View {
//
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//
//                List {
//
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                    Button("Add Number") {
//
//                        numbers.append(currentNumber)
//                        currentNumber += 1
//                    }
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//
//        }
//
//
//    }
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}


//struct SecondView: View {
//
//    @Environment(\.dismiss) var dismiss
//
//    let name: String
//
//    var body: some View {
//        Button("Dismiss"){
//            dismiss()
//        }
//    }
//}
//
//struct ContentView: View {
//
//    @State private var showingSheet = false
//
//    var body: some View {
//        Button("Show Sheet"){
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "john")
//        }
//
//
//    }
//}


