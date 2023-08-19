//
//  phoneOnlyStackNavigationView.swift
//  SnowSeeker98
//
//  Created by Александра Фонова on 19.08.2023.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigayionView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
