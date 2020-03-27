//
//  ImageManager.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 27/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class ImageManager {
    
    static var shared = ImageManager()
    
    // TO DO: - If error, set placeholder
    func downloadImage(from url: URL, imageView: UIImageView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
