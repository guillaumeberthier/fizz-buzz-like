//
//  AppError.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

enum AppError: LocalizedError {
    case inputError

    var errorDescription: String? {
        switch self {
        case .inputError:
            return "Input Error"
        }
    }
}
