//
//  CIError.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//

import UIKit
public enum CIError: Error {
    case imageDataSaveError
    case noImageDataToSave
    case fetchImageDataRequestFailed
    
    public var errorMessage: String {
        switch self {
        case .imageDataSaveError:
            return "Could not save the Image Data into Core Data"
        case .noImageDataToSave:
            return "No Image Data to Save"
        case .fetchImageDataRequestFailed:
            return "Failed to fetch Image Data from DB failed."
        }
    }
}
