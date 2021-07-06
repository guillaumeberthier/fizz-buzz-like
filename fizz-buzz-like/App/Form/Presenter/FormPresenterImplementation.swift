//
//  FormPresenterImplementation.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

class FormPresenterImplementation: FormPresenter {

    private weak var viewContract: FormViewContract?
    private weak var delegate: FormPresenterDelegate?
    private let mapper = FormViewModelMapper()
    private var formRequestInput = FormRequestInput.initial

    init(viewContract: FormViewContract,
         delegate: FormPresenterDelegate?) {
        self.viewContract = viewContract
        self.delegate = delegate
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
        var allowComputing = true
        if Int(formRequestInput.firstDivider) == nil {
            formRequestInput = formRequestInput.withFirstDivider("")
            allowComputing = false
        }
        if Int(formRequestInput.secondDivider) == nil {
            formRequestInput = formRequestInput.withSecondDivider("")
            allowComputing = false
        }
        if Int(formRequestInput.limit) == nil {
            formRequestInput = formRequestInput.withLimit("")
            allowComputing = false
        }
        guard allowComputing else {
            viewContract?.display(error: .invalidInput)
            updateView(with: formRequestInput)
            return
        }
        compute(input: formRequestInput)
    }

    func requestStatistics() {
        delegate?.formPresenterDidRequestStatistics(self)
    }

    // MARK: - Private

    private func updateView(with request: FormRequestInput) {
        let viewModel = mapper.map(model: request)
        viewContract?.display(viewModel: viewModel)
    }

    private func compute(input: FormRequestInput) {
        guard
            let firstDivider = Int(formRequestInput.firstDivider),
            let secondDivider = Int(formRequestInput.secondDivider),
            let limit = Int(formRequestInput.limit)
        else {
            assertionFailure("FormRequestInput should be valid")
            return
        }
        let request = FizzBuzzRequest(
            firstDivider: firstDivider,
            secondDivider: secondDivider,
            limit: limit,
            firstText: formRequestInput.firstText,
            secondText: formRequestInput.secondText
        )
        delegate?.formPresenter(self, didRequestCompute: request)
    }
}
