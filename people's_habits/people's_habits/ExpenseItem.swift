//
//  ExpenseItem.swift
//  people's_habits
//
//  Created by Александра Фонова on 01.05.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
