//
//  FormPresenter.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

protocol FormPresenter {

    /// View did load
    func start()

    func value(for cellId: FormCellViewModel.Identifier, didChange newValue: String)

    /// User requests to compute fizz-buzz with the input he set
    func compute()

    /// User requests to display statitistics view
    func requestStatistics()
}

protocol FormPresenterDelegate: AnyObject {

    /// User requests to display statitistics view
    func formPresenterDidRequestStatistics(_ presenter: FormPresenter)

    /// User requests to compute the request he created from the form
    func formPresenter(_ presenter: FormPresenter, didRequestCompute request: FizzBuzzRequest)
}
