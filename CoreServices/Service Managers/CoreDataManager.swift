//
//  CoreDataManager.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import Foundation
import CoreData

public class CoreDataManager: CoreDataSource {
    
    private let coreDataStack: CoreDataProtocol!
    
    public init(coreDataStack: CoreDataProtocol) {
        self.coreDataStack = coreDataStack
    }
    
    public func saveData(data: [ImageDataResult]) throws -> Bool {
        data.forEach {
            let docDomain = ImageData(context: coreDataStack.imageDataMOC)
            docDomain.title = $0.headline
            docDomain.descriptionAbstract = $0.description
            docDomain.imageURL = $0.multimedia
            docDomain.date = $0.date
        }
        do {
            try commitImageDataChanges()
            return true
        } catch {
            throw CIError.imageDataSaveError
        }
        
    }
    
    public func fetchData() throws -> [ImageDataResult]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ManagedObjectIdentifiers.imageData.rawValue)
        let sortDescriptor = NSSortDescriptor(key: ManagedObjectIdentifiers.dateSortDescriptor.rawValue, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            let fetchResult = try coreDataStack.imageDataMOC.fetch(fetchRequest)
            return transformValue(from: fetchResult)
        } catch {
            throw CIError.fetchImageDataRequestFailed
        }
    }
}

extension CoreDataManager {
    private func commitImageDataChanges() throws {
        do {
            try coreDataStack.imageDataMOC.save()
        } catch let error {
            throw error
        }
    }
    
    private func transformValue(from object: [NSFetchRequestResult]?) -> [ImageDataResult] {
        guard let data = object as? [ImageData] else {
            return []
        }
        
        let list = data.map {
            return ImageDataResult(abstract: $0.descriptionAbstract ?? "", multimedia: $0.imageURL ?? "", headline: $0.title ?? "", date: $0.date ?? Date())
        }
        return list
    }
}
