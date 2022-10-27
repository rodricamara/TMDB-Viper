//
//  UITextView+Extensions.swift
//  Movies
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import UIKit

extension UITextView {
    func setTextWithStyle(text: String?, style: NSMutableParagraphStyle) {
        let attrString = NSMutableAttributedString(string: text ?? "")
        attrString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSRange(location: 0,
                           length: text?.count ?? 0)
        )
        attributedText = attrString
    }
    
}
