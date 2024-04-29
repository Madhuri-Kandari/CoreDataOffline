//
//  MainViewModel.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import Foundation
import CoreServices
import Swinject

class MainViewModel {
    private var imageDataProtocol: ImageDataProtocol!
    
    init(imageDataProtocol: ImageDataProtocol) {
        self.imageDataProtocol = imageDataProtocol
    }
    
    func saveData() -> Bool {
        guard let data = getDataResponse() else {
            return false
        }
        do {
            let _ = try imageDataProtocol.saveImageData(data: data)
            return true
        } catch _ {
            return false
        }
    }
    
    private func getDataResponse() -> [ImageDataResult]? {
        return imageDataProtocol.getDataResponse()
    }
}
