//
//  AddView.swift
//  iExpense
//
//  Created by Александра Фонова on 18.04.2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "sport"
    @State private var amount = 0.0

    let types = ["sport", "healthy habit", "study", "other"]
    
    var body: some View {
        NavigationView {
            Form {
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("What a habit?")
                        .font(.headline)
                    TextField("text", text: $name)
                }
                
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                
            }
            
            .navigationTitle("Add new habit")
            .toolbar{
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss() 
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
