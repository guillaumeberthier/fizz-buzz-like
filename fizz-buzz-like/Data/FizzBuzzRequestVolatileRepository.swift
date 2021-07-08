//
//  FizzBuzzRequestVolatileRepository.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

/// This volatile implementation does not persist data
class FizzBuzzRequestVolatileRepository: FizzBuzzRequestRepository {

    /// Requests and the number of time it has been requested
    private var countByRequest: [FizzBuzzRequest: Int] = [:]

    /// Current max count
    private var currentMaxCount = 0

    /// Total requests count
    private var totalCount = 0

    // MARK: - FizzBuzzRequestRepository

    func add(request: FizzBuzzRequest, completion: (Result<Void, AppError>) -> Void) {
        totalCount += 1
        countByRequest[request] = (countByRequest[request] ?? 0) + 1
        let currentCount = countByRequest[request] ?? 0
        currentMaxCount = max(currentMaxCount, currentCount)
        completion(.success(()))
    }

    func favoriteRequestStatistics(completion: (Result<FizzBuzzRequestCountStatistics, AppError>) -> Void) {
        let currentMaxRequests = countByRequest
            .filter { $0.value == currentMaxCount }
            .map { $0.key }
        let statistics = FizzBuzzRequestCountStatistics(
            values: currentMaxRequests,
            count: currentMaxCount,
            totalCount: totalCount
        )
        completion(.success(statistics))
    }
}
