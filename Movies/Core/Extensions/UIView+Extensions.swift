//
//  UIView+Extensions.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import UIKit

extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }
    
    func addSubviews(_ views: UIView...) { views.forEach { addSubview($0) } }
    
    func fillSuperView() {
        if let superview = superview {
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superview.topAnchor),
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            ])
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
