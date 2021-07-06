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
            FormCellViewModel(
                id: .firstNumber,
                title: "form_first_divider_placeholder".localized(),
                value: model.firstDivider
            ),
            FormCellViewModel(
                id: .secondNumber,
                title: "form_second_divider_placeholder".localized(),
                value: model.secondDivider
            ),
            FormCellViewModel(
                id: .limit,
                title: "form_limit_placeholder".localized(),
                value: model.limit
            ),
            FormCellViewModel(
                id: .firstText,
                title: "form_first_text_placeholder".localized(),
                value: model.firstText
            ),
            FormCellViewModel(
                id: .secondText,
                title: "form_second_text_placeholder".localized(),
                value: model.secondText
            ),
        ])
    }
}
