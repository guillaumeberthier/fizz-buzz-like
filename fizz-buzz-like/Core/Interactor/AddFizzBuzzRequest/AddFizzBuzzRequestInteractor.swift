//
//  AddFizzBuzzRequestInteractor.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

/// Store fizz-buzz request
protocol AddFizzBuzzRequestInteractor {
    func execute(request: FizzBuzzRequest, completion: (Result<Void, AppError>) -> Void)
}
