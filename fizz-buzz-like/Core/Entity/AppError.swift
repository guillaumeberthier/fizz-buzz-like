//
//  AppError.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

enum AppError: LocalizedError {

    /// Bad input has been set.
    /// - input was not an Int where we expected one;
    /// - input is higher than a 64 bits Int;
    case inputError

    var errorDescription: String? {
        switch self {
        case .inputError:
            return "Input Error"
        }
    }
}
