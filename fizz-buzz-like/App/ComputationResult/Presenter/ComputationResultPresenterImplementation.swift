//
//  ComputationResultPresenterImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

class ComputationResultPresenterImplementation: ComputationResultPresenter {

    private weak var viewContract: FormViewContract?

    init(viewContract: FormViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - ComputationResultPresenter

    func start() {
    }
}
