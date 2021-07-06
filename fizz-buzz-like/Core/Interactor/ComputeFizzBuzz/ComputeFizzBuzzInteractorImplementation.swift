//
//  ComputeFizzBuzzInteractorImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

class ComputeFizzBuzzInteractorImplementation: ComputeFizzBuzzInteractor {

    // MARK: - ComputeFizzBuzzInteractor

    func execute(request: FizzBuzzRequest,
                 completion: @escaping (Result<FizzBuzzResponse, AppError>) -> Void) {
        guard request.isValid else {
            completion(.failure(.invalidRequest))
            return
        }
        // TODO (Guillaume Berthier) Register request to handle statistics
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
        completion(.success(response))
    }
}

private extension FizzBuzzRequest {

    var isValid: Bool {
        return limit > 0
    }
}
