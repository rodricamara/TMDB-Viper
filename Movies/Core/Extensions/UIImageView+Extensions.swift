//
//  UIImageView+Extensions.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import UIKit

extension UIImageView {
    func image(fromUrl url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: response)
                }
            }
        }
        task.resume()
    }
    
    func image(fromString urlString: String) {
        guard let url = URL(string: urlString)else {
            return
        }
        image(fromUrl: url)
    }
}
