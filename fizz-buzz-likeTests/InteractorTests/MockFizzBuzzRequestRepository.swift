//
//  MockFizzBuzzRequestRepository.swift
//  fizz-buzz-likeTests
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation
@testable import fizz_buzz_like

class MockFizzBuzzRequestRepository: FizzBuzzRequestRepository {

    // MARK: - FizzBuzzRequestRepository

    func add(request: FizzBuzzRequest, completion: (Result<Void, AppError>) -> Void) {
        // no-op
    }

    func favoriteRequestStatistics(completion: (Result<FizzBuzzRequestCountStatistics, AppError>) -> Void) {
        // no-op
    }
}
