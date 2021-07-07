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
    private let viewModelMapper = FormViewModelMapper()
    private let requestMapper = FizzBuzzRequestMapper()
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
        let result = requestMapper.map(formRequestInput: formRequestInput)
        switch result {
        case .success(let request):
            delegate?.formPresenter(self, didRequestCompute: request)
        case .failure(let error):
            handleInputError(error)
        }
    }

    func requestStatistics() {
        delegate?.formPresenterDidRequestStatistics(self)
    }

    // MARK: - Private

    private func updateView(with request: FormRequestInput) {
        let viewModel = viewModelMapper.map(model: request)
        viewContract?.display(viewModel: viewModel)
    }

    private func handleInputError(_ inputError: FormRequestInput.Error) {
        for error in inputError.errors {
            switch error {
            case .invalidFirstDivider:
                formRequestInput = formRequestInput.withFirstDivider("")
            case .invalidSecondDivider:
                formRequestInput = formRequestInput.withSecondDivider("")
            case .invalidLimit:
                formRequestInput = formRequestInput.withLimit("")
            }
        }
        viewContract?.display(error: .invalidInput)
        updateView(with: formRequestInput)
    }
}
