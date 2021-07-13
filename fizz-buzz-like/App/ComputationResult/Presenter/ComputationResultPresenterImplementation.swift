//
//  ComputationResultPresenterImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

class ComputationResultPresenterImplementation: ComputationResultPresenter {

    private weak var viewContract: ComputationResultViewContract?
    private let fizzBuzzRequest: FizzBuzzRequest
    private let computeInteractor: ComputeFizzBuzzInteractor
    private let mapper = ComputationResultViewModelMapper()

    init(viewContract: ComputationResultViewContract,
         fizzBuzzRequest: FizzBuzzRequest,
         computeInteractor: ComputeFizzBuzzInteractor) {
        self.viewContract = viewContract
        self.fizzBuzzRequest = fizzBuzzRequest
        self.computeInteractor = computeInteractor
    }

    // MARK: - ComputationResultPresenter

    func compute(index: Int) -> String {
        return computeInteractor.execute(request: fizzBuzzRequest, index: index).word
    }

    var limit: Int {
        return fizzBuzzRequest.limit
    }
}
