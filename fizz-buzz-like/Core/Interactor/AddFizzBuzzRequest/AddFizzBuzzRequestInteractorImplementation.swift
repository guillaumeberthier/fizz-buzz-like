//
//  AddFizzBuzzRequestInteractorImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

class AddFizzBuzzRequestInteractorImplementation: AddFizzBuzzRequestInteractor {

    private let requestRepository: FizzBuzzRequestRepository

    init(requestRepository: FizzBuzzRequestRepository) {
        self.requestRepository = requestRepository
    }

    // MARK: - AddFizzBuzzRequestInteractor

    func execute(request: FizzBuzzRequest, completion: (Result<Void, AppError>) -> Void) {
        requestRepository.add(request: request, completion: completion)
    }
}
