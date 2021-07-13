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
                 index: Int) -> FizzBuzzResponse {
        guard request.limit > 0, index < request.limit else {
            return FizzBuzzResponse(word: "")
        }
        let i = index
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
        let response = FizzBuzzResponse(word: word)
        return response
    }
}
