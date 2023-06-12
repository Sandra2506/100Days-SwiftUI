//
//  DataController.swift
//  Bookworm
//
//  Created by Александра Фонова on 20.05.2023.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores { descriptoin, error in
            if let error = error {
                print("Core Date failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
}
