//
//  AppError.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

enum AppError: LocalizedError {

    /// Invalid input has been set.
    /// - input was not an Int where we expected one;
    /// - input is higher than a 64 bits Int;
    case invalidInput

    /// - limit should be greater than 0
    case invalidRequest

    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "Invalid input"
        case .invalidRequest:
            return "Invalid request"
        }
    }
}
