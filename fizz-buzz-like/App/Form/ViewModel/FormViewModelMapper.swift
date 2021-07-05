//
//  FormViewModelMapper.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

struct FormViewModelMapper {

    func map(model: FormRequestInput) -> FormViewModel {
        return FormViewModel(cells: [
            FormCellViewModel(id: .firstNumber, title: "First divider", value: model.firstDivider),
            FormCellViewModel(id: .secondNumber, title: "Second divider", value: model.secondDivider),
            FormCellViewModel(id: .limit, title: "Limit", value: model.limit),
            FormCellViewModel(id: .firstText, title: "First text", value: model.firstText),
            FormCellViewModel(id: .secondText, title: "Second text", value: model.secondText),
        ])
    }
}
