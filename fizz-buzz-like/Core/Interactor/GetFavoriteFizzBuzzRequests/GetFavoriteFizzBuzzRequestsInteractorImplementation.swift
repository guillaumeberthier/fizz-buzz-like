//
//  GetFavoriteFizzBuzzRequestsInteractorImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

class GetFavoriteFizzBuzzRequestsInteractorImplementation: GetFavoriteFizzBuzzRequestsInteractor {

    private let requestRepository: FizzBuzzRequestRepository

    init(requestRepository: FizzBuzzRequestRepository) {
        self.requestRepository = requestRepository
    }

    // MARK: - GetFavoriteFizzBuzzRequestsInteractor

    func execute(completion: (Result<FizzBuzzRequestCountStatistics, AppError>) -> Void) {
        requestRepository.favoriteRequestStatistics(completion: completion)
    }
}
