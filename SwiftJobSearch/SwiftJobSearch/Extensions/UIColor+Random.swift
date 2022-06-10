//
//  UIColor+Random.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/9/22.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...0.5),
            green: .random(in: 0...0.5),
            blue: .random(in: 0...0.5),
            alpha: 1.0
        )
    }
}
