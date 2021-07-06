//
//  FormPresenter.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

protocol FormPresenter {
    func start()
    func value(for cellId: FormCellViewModel.Identifier, didChange newValue: String)
    func compute()
    func requestStatistics()
}

protocol FormPresenterDelegate: AnyObject {
    func formPresenterDidRequestStatistics(_ presenter: FormPresenter)
}
