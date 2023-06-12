//
//  ContentView.swift
//  iExpense
//
//  Created by Александра Фонова on 15.04.2023.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit")
            .toolbar{
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
                
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) { 
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
