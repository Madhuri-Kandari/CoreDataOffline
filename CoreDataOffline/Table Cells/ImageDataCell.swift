//
//  ImageDataCell.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//

import UIKit
import CoreServices

class ImageDataCell: UITableViewCell {

    @IBOutlet private weak var imageViewOutlet: UIImageView!
    @IBOutlet private weak var titleOutlet: UILabel!
    @IBOutlet private weak var descriptionOutlet: UILabel!
    @IBOutlet private weak var dateOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureImageCell(imageData: ImageDataResult) {
        titleOutlet.text = imageData.headline
        descriptionOutlet.text = imageData.description
        dateOutlet.text = Utility.dateToString(date: imageData.date)
        downloadImage(for: imageData.multimedia, with: UIImage(systemName: "doc"))
    }
    
    //MARK: downloading the image from the result url else placing the placeholder image
    private func downloadImage(for url: String, with placeHolder: UIImage?) {
        if let image = UIImage.getCachedImage(for: url) {
            imageViewOutlet.image = image
        } else {
            UIImage.loadImage(urlString: url) { image in
                DispatchQueue.main.async { [weak self] in
                    guard image != nil else {
                        self?.imageViewOutlet.image = placeHolder
                        return
                    }
                    self?.imageViewOutlet.image = image
                }
            }
        }
    }

}
