//
//  ApplicationCoordinator.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation
import UIKit

class ApplicationCoordinator {

    private let window: UIWindow
    private let navigationViewController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let formViewController = FormViewController()
        // TODO (Guillaume Berthier) Inject using DI
        formViewController.presenter = FormPresenterImplementation(
            viewContract: formViewController,
            delegate: self
        )
        navigationViewController.viewControllers = [formViewController]
        window.rootViewController = navigationViewController
    }
}

extension ApplicationCoordinator: FormPresenterDelegate {

    // MARK: - FormPresenterDelegate

    func formPresenterDidRequestStatistics(_ presenter: FormPresenter) {
        let statisticsViewController = StatisticsViewController()
        statisticsViewController.presenter = StatisticsPresenterImplementation(
            viewContract: statisticsViewController
        )
        navigationViewController.pushViewController(statisticsViewController, animated: true)
    }

    func formPresenter(_ presenter: FormPresenter, didRequestCompute request: FizzBuzzRequest) {
        // TODO (Guillaume Berthier) Inject using DI
        let requestRepository = FizzBuzzRequestVolatileRepository()
        // TODO (Guillaume Berthier) Inject using DI
        let interactor = ComputeFizzBuzzInteractorImplementation(
            requestRepository: requestRepository
        )
        let resultViewController = ComputationResultViewController()
        // TODO (Guillaume Berthier) Inject using DI
        resultViewController.presenter = ComputationResultPresenterImplementation(
            viewContract: resultViewController,
            fizzBuzzRequest: request,
            computeInteractor: interactor
        )
        navigationViewController.pushViewController(resultViewController, animated: true)
    }
}
