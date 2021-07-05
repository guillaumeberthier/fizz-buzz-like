//
//  FormPresenterImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

class FormPresenterImplementation: FormPresenter {

    private weak var viewContract: FormViewContract?

    init(viewContract: FormViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - FormPresenter

    func start() {
        // TODO (Guillaume Berthier) Init view model to present to view controller
    }
}
