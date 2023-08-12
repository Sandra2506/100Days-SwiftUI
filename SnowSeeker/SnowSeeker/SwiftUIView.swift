//
//  SwiftUIView.swift
//  SnowSeeker
//
//  Created by Александра Фонова on 12.08.2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
