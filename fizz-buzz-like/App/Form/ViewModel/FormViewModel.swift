//
//  FormViewModel.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

struct FormViewModel {
    let cells: [FormCellViewModel]
}

struct FormCellViewModel {

    enum Identifier: String {
        case firstNumber, secondNumber, limit, firstText, secondText
    }

    let id: Identifier
    let title: String
    let value: String
}
