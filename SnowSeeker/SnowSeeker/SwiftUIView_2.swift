//
//  SwiftUIView_2.swift
//  SnowSeeker
//
//  Created by Александра Фонова on 12.08.2023.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct SwiftUIView_2: View {
    @State private var selectedUser: User? = nil
       @State private var isShowingUser = false

       var body: some View {
           Text("Hello, World!")
               .onTapGesture {
                   selectedUser = User()
                   isShowingUser = true
               }
               .alert("Welcome", isPresented: $isShowingUser) { }
       }
}

struct SwiftUIView_2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_2()
    }
}
