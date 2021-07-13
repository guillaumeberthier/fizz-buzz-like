//
//  Color.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 08/07/2021.
//

import Foundation
import UIKit

extension UIColor {

    static var randomColor: UIColor {
        return UIColor(
            red: .random(in: 0...1.0),
            green: .random(in: 0...1.0),
            blue: .random(in: 0...1.0),
            alpha: 0.6
        )
    }

    // TODO (Guillaume Berthier) Remove useless code

    // Courtesy of
    // https://www.hackingwithswift.com/example-code/uicolor/how-to-read-the-red-green-blue-and-alpha-color-components-from-a-uicolor
    private var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}
