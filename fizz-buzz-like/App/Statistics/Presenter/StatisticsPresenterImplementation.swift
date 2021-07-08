//
//  StatisticsPresenterImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

class StatisticsPresenterImplementation: StatisticsPresenter {

    private weak var viewContract: StatisticsViewContract?
    private let getStatisticsInteractor: GetFavoriteFizzBuzzRequestsInteractor
    private let mapper = StatisticsViewModelMapper()

    init(viewContract: StatisticsViewContract,
         getStatisticsInteractor: GetFavoriteFizzBuzzRequestsInteractor) {
        self.viewContract = viewContract
        self.getStatisticsInteractor = getStatisticsInteractor
    }

    // MARK: - StatisticsPresenter

    func start() {
        displayStatistics()
    }

    // MARK: - Private

    private func displayStatistics() {
        getStatisticsInteractor.execute { result in
            switch result {
            case .success(let statistics):
                let viewModel = mapper.map(countStatistics: statistics)
                viewContract?.display(viewModel: viewModel)
            case .failure(let error):
                viewContract?.display(error: error)
            }
        }
    }
}
