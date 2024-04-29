//
//  CoreDataStack.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import Foundation
import CoreData

public class CoreDataStack: CoreDataProtocol {
    
    public init() {}
    
    private lazy var imageDataPersistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: ManagedObjectIdentifiers.imageData.rawValue)
        let sqliteFileName = getImageDataStoreName()
        
        let storeURL = try! FileManager
            .default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathExtension(sqliteFileName)
        print(storeURL)
        let persistentStoreDescription = NSPersistentStoreDescription(url: storeURL)
        persistentStoreDescription.type = NSSQLiteStoreType
        persistentStoreDescription.shouldInferMappingModelAutomatically = true
        persistentStoreDescription.shouldMigrateStoreAutomatically = true
        container.persistentStoreDescriptions = [persistentStoreDescription]
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        })
        return container
    }()
    
    public var imageDataMOC: NSManagedObjectContext {
        return imageDataPersistentContainer.viewContext
    }
    
    private func getImageDataStoreName() -> String {
        //MARK: based on the user name or any other factor we can create this sqlite file name to store the data
        let userName = "MADHURI"
        let sqliteFileName = String(format: "%@.%@", userName, ManagedObjectIdentifiers.sqlite.rawValue)
        return sqliteFileName
    }
}
