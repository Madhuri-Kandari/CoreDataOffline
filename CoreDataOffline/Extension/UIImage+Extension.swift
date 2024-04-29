//
//  UIImage+Extension.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//

import UIKit

public extension UIImage {
    
    //MARK: get image that is in cache
    static func getCachedImage(for urlString: String) -> UIImage? {
        return ImageCache.shared.object(forKey: urlString as AnyObject) as? UIImage
    }
    //MARK: loading the image from the url and then caching it
    static func loadImage(urlString: String, completion: @escaping(UIImage?)->()) {
        if let cachedImage = ImageCache.shared.object(forKey: urlString as AnyObject) as? UIImage {
            completion(cachedImage)
            return
        }
        let newURL = "https://www.nytimes.com/" + urlString
        guard let url = URL(string: newURL) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil)
                return
            }
            guard let data = data,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            ImageCache.shared.setObject(image, forKey: urlString as AnyObject)
            completion(image)
        }.resume()
    }
}
