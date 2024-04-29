//
//  ImageData+CoreDataProperties.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//
//

import Foundation
import CoreData


extension ImageData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageData> {
        return NSFetchRequest<ImageData>(entityName: "ImageData")
    }

    @NSManaged public var date: Date?
    @NSManaged public var descriptionAbstract: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var title: String?

}

extension ImageData : Identifiable {

}
