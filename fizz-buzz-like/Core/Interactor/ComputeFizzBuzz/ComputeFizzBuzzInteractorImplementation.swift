//
//  ComputeFizzBuzzInteractorImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

class ComputeFizzBuzzInteractorImplementation: ComputeFizzBuzzInteractor {

    private let requestRepository: FizzBuzzRequestRepository

    init(requestRepository: FizzBuzzRequestRepository) {
        self.requestRepository = requestRepository
    }

    // MARK: - ComputeFizzBuzzInteractor

    func execute(request: FizzBuzzRequest,
                 completion: @escaping (Result<FizzBuzzResponse, AppError>) -> Void) {
        guard request.limit > 0 else {
            completion(.failure(.invalidInput))
            return
        }
        requestRepository.add(request: request) { _ in /* no-op */ }
        DispatchQueue.global().async {
            var words: [String] = []
            for i in 1...request.limit {
                var word = String(i)
                var isMultipleOfFirst = false
                var isMultipleOfSecond = false
                if i.isMultiple(of: request.firstDivider) {
                    word = request.firstText
                    isMultipleOfFirst = true
                }
                if i.isMultiple(of: request.secondDivider) {
                    word = request.secondText
                    isMultipleOfSecond = true
                }
                if isMultipleOfFirst && isMultipleOfSecond {
                    word = request.firstText + request.secondText
                }
                words.append(word)
            }
            let response = FizzBuzzResponse(words: words)
            DispatchQueue.main.async { completion(.success(response)) }
        }
    }
}
