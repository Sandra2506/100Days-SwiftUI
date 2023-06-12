//
//  StringIsEmpty.swift
//  Bookworm
//
//  Created by Александра Фонова on 25.05.2023.
//

import Foundation

extension String{
    var isReallyEmply: Bool{
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
