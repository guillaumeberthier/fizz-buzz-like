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
            title: "error".localized(),
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
