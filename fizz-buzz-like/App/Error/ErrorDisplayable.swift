//
//  ErrorDisplayable.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation
import UIKit

protocol ErrorDisplayable {
    func display(error: AppError)
}

extension UIViewController: ErrorDisplayable {

    // MARK: - ErrorDisplayable

    func display(error: AppError) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
