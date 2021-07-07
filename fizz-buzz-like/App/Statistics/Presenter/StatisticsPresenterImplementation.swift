//
//  StatisticsPresenterImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

class StatisticsPresenterImplementation: StatisticsPresenter {

    private weak var viewContract: StatisticsViewContract?

    init(viewContract: StatisticsViewContract?) {
        self.viewContract = viewContract
    }

    // MARK: - StatisticsPresenter

    func start() {
    }
}
