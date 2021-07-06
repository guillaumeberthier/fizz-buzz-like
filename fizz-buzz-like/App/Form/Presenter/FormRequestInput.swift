//
//  FormRequestInput.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

/// Representing the user input
struct FormRequestInput {
    let firstDivider: String
    let secondDivider: String
    let limit: String
    let firstText: String
    let secondText: String

    static let initial = FormRequestInput(
        firstDivider: "",
        secondDivider: "",
        limit: "",
        firstText: "",
        secondText: ""
    )

    // MARK: - Builder

    func withFirstDivider(_ value: String) -> FormRequestInput {
        return FormRequestInput(
            firstDivider: value,
            secondDivider: secondDivider,
            limit: limit,
            firstText: firstText,
            secondText: secondText
        )
    }

    func withSecondDivider(_ value: String) -> FormRequestInput {
        return FormRequestInput(
            firstDivider: firstDivider,
            secondDivider: value,
            limit: limit,
            firstText: firstText,
            secondText: secondText
        )
    }

    func withLimit(_ value: String) -> FormRequestInput {
        return FormRequestInput(
            firstDivider: firstDivider,
            secondDivider: secondDivider,
            limit: value,
            firstText: firstText,
            secondText: secondText
        )
    }

    func withFirstText(_ value: String) -> FormRequestInput {
        return FormRequestInput(
            firstDivider: firstDivider,
            secondDivider: secondDivider,
            limit: limit,
            firstText: value,
            secondText: secondText
        )
    }

    func withSecondText(_ value: String) -> FormRequestInput {
        return FormRequestInput(
            firstDivider: firstDivider,
            secondDivider: secondDivider,
            limit: limit,
            firstText: firstText,
            secondText: value
        )
    }
}
