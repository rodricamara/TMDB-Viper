//
//  UIImage+Extensions.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import Foundation

import UIKit

extension UIImage {
    var noir: UIImage? {
        let context = CIContext(options: nil)
        guard let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
        else {
            return nil
        }
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        if let output = currentFilter.outputImage,
           let cgImage = context.createCGImage(output, from: output.extent) {
            return UIImage(
                cgImage: cgImage,
                scale: scale,
                orientation: imageOrientation)
        }
        return nil
    }
}
