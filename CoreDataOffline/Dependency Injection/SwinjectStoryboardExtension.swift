//
//  SwinjectStoryboardExtension.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import SwinjectStoryboard
import UIKit
import CoreServices

extension SwinjectStoryboard {
     @objc class func setup() {
         
         defaultContainer.register(NetworkClient.self) { _ in NetworkClient() }
             .inObjectScope(.container)
         
         defaultContainer.register(ImageDataRepository.self) { r in ImageDataRepository(networkProtocol: r.resolve(NetworkClient.self)!, coreDataSource: r.resolve(CoreDataManager.self)!)
         }.inObjectScope(.container)
         
         defaultContainer.register(CoreDataManager.self) { r in CoreDataManager(coreDataStack: r.resolve(CoreDataStack.self)!) }.inObjectScope(.container)
         
         defaultContainer.register(CoreDataStack.self) { r in CoreDataStack() }
         
         defaultContainer.storyboardInitCompleted(MainViewController.self) { r, c in
             let viewModel = MainViewModel(imageDataProtocol: r.resolve(ImageDataRepository.self)!)
             c.mainViewModel = viewModel
         }
         
         defaultContainer.storyboardInitCompleted(ShowDataViewController.self) { r, c in
             let viewModel = ShowDataViewModel(imageDataProtocol: r.resolve(ImageDataRepository.self)!)
             c.showDataViewModel = viewModel
         }
    }
}
