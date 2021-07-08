//
//  FizzBuzzRequestRepository.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

protocol FizzBuzzRequestRepository {
    func add(request: FizzBuzzRequest, completion: (Result<Void, AppError>) -> Void)
    func favoriteRequestStatistics(completion: (Result<FizzBuzzRequestCountStatistics, AppError>) -> Void)
}
