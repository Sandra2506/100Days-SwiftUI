//
//  ImageOverlay.swift
//  SnowSeeker98
//
//  Created by Александра Фонова on 19.08.2023.
//

import SwiftUI

struct ImageOverlay: View {
    var text: String
    
    var body: some View {
        ZStack {
            Text("Credit: \(text)")
                .font(.caption)
                .padding(6)
                .foregroundColor(.white)
        }
        .background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(10)
    }
}


