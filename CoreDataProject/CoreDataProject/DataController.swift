//
//  DataController.swift
//  CoreDataProject
//
//  Created by Александра Фонова on 01.06.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init(){
        container.loadPersistentStores { descriptoin, error in
            if let error = error {
                print("Core Date failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
}
