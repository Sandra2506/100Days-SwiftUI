//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Александра Фонова on 18.04.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable { 
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
