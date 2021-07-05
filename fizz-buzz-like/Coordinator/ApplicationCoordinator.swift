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
        formViewController.presenter = FormPresenterImplementation(
            viewContract: formViewController
        )
        navigationViewController.viewControllers = [formViewController]
        window.rootViewController = navigationViewController
    }
}
