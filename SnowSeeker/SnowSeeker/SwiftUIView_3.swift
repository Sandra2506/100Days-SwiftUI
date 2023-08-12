//
//  SwiftUIView_3.swift
//  SnowSeeker
//
//  Created by Александра Фонова on 12.08.2023.
//

import SwiftUI

struct SwiftUIView_3: View {
    @State private var searchText = ""

        var body: some View {
            NavigationView {
                Text("Searching for \(searchText)")
                    .searchable(text: $searchText, prompt: "Look for something")
                    .navigationTitle("Searching")
            }
        }
}

struct SwiftUIView_3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_3()
    }
}
