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

    func start() {
        compute(request: fizzBuzzRequest)
    }

    // MARK: - Private

    private func compute(request: FizzBuzzRequest) {
        viewContract?.showLoading()
        computeInteractor.execute(request: request) { [weak self] result in
            guard let self = self else { return }
            self.viewContract?.hideLoading()
            switch result {
            case .success(let response):
                let viewModel = self.mapper.map(response: response)
                self.viewContract?.display(viewModel: viewModel)
            case .failure(let error):
                self.viewContract?.display(error: error)
            }
        }
    }
}
