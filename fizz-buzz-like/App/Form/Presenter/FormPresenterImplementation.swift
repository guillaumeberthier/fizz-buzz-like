//
//  FormPresenterImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

class FormPresenterImplementation: FormPresenter {

    private weak var viewContract: FormViewContract?
    private let mapper = FormViewModelMapper()
    private var formRequestInput = FormRequestInput.initial

    init(viewContract: FormViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - FormPresenter

    func start() {
        updateView(with: formRequestInput)
    }

    func value(for cellId: FormCellViewModel.Identifier, didChange newValue: String) {
        switch cellId {
        case .firstNumber:
            formRequestInput = formRequestInput.withFirstDivider(newValue)
        case .secondNumber:
            formRequestInput = formRequestInput.withSecondDivider(newValue)
        case .limit:
            formRequestInput = formRequestInput.withLimit(newValue)
        case .firstText:
            formRequestInput = formRequestInput.withFirstText(newValue)
        case .secondText:
            formRequestInput = formRequestInput.withSecondText(newValue)
        }
    }

    func compute() {
        // TODO (Guillaume Berthier) Compute FizzBuzzRequest
    }

    // MARK: - Private

    private func updateView(with request: FormRequestInput) {
        let viewModel = mapper.map(model: request)
        viewContract?.display(viewModel: viewModel)
    }
}
