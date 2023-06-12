//
//  StringlsEmpty.swift
//  CupcakeCorner
//
//  Created by Александра Фонова on 18.05.2023.
//

import SwiftUI
        extension String {
            var isReallyEmpty: Bool {
                self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
        }


