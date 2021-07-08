//
//  UIStackView+RemoveAllSubviews.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 08/07/2021.
//

import Foundation
import UIKit

extension UIStackView {

    func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
