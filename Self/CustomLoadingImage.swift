//
//  CustomLoadingImage.swift
//  SeekSupport
//
//  Created by Thenny Chhorn on 7/10/20.
//  Copyright © 2020 Thenny Chhorn. All rights reserved.
//

import UIKit

var imageCache = [String: UIImage]()

class CustomImageView: UIImageView {
    
    var lastUrlUsedToLoadImage: String?
    
    func loadImage(urlString: String) {
        lastUrlUsedToLoadImage = urlString
        self.image = nil
        if let cachImage = imageCache[urlString] {
            self.image = cachImage
            return
        }
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to download image", error)
            }
            if url.absoluteString != self.lastUrlUsedToLoadImage {
                return
            }
            guard let imageData = data else {return}
            let imagePhoto = UIImage(data: imageData)
            imageCache[url.absoluteString] = imagePhoto
            DispatchQueue.main.async {
                self.image = imagePhoto
            }
            }.resume()
    }
}

