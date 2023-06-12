//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Александра Фонова on 01.06.2023.
//
import CoreData
import SwiftUI
struct Student: Hashable {
    let name:String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    var body: some View{
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Enterprise"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Enterprise"
                ship3.universe = "Star Trek"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Enterprise"
                ship4.universe = "Star Trek"
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
