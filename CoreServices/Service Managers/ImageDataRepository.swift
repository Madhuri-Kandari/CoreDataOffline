//
//  ImageDataRepository.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//

import Foundation

enum FileNames: String {
    case dataFile = "data"
}

public class ImageDataRepository: ImageDataProtocol {
    
    private let networkProtocol: NetworkProtocol!
    private let coreDataSource: CoreDataSource!
    
    public init(networkProtocol: NetworkProtocol, coreDataSource: CoreDataSource) {
        self.coreDataSource = coreDataSource
        self.networkProtocol = networkProtocol
    }
    
    public func saveImageData(data: [ImageDataResult]) throws -> Bool {
        return try coreDataSource.saveData(data: data)
    }
    
    public func fetchImageData()throws -> [ImageDataResult]? {
        return try coreDataSource.fetchData()
    }
    
    public func getDataResponse() -> [ImageDataResult]? {
        let dataResult: DataModelResponse = networkProtocol.load(resource: FileNames.dataFile.rawValue)
        var imageResult: [ImageDataResult] = []
        for imageDataResult in dataResult.response.docs {
            imageResult.append(ImageDataResult(doc: imageDataResult))
        }
        return imageResult
    }
}
