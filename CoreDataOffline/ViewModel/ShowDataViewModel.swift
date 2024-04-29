//
//  ImageDataViewModel.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import Foundation
import CoreServices

class ShowDataViewModel {
    
    private var imageDataProtocol: ImageDataProtocol!
    
    init(imageDataProtocol: ImageDataProtocol) {
        self.imageDataProtocol = imageDataProtocol
    }
    
    func getImageDataResult() -> [ImageDataResult] {
        if Reachability.isConnectedToNetwork() {
            return imageDataProtocol.getDataResponse() ?? []
        } else {
            return fetchImageDataResult()
        }
    }
    
    func fetchImageDataResult() -> [ImageDataResult] {
        do {
            return try imageDataProtocol.fetchImageData() ?? []
        } catch let error {
            print(error)
            return []
        }
    }
    
}
