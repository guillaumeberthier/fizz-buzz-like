//
//  FizzBuzzRequestMapper.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

struct FizzBuzzRequestMapper {

    func map(
        formRequestInput: FormRequestInput
    ) -> Result<FizzBuzzRequest, FormRequestInput.Error> {

        var errors: [FormRequestInput.Error.Kind] = []
        if Int(formRequestInput.firstDivider) == nil {
            errors.append(.invalidFirstDivider)
        }
        if Int(formRequestInput.secondDivider) == nil {
            errors.append(.invalidSecondDivider)
        }
        if
            Int(formRequestInput.limit) == nil
            || Int(formRequestInput.limit) ?? 0 < 1
        {
            errors.append(.invalidLimit)
        }
        guard errors.isEmpty else {
            return .failure(FormRequestInput.Error(errors: errors))
        }
        guard
            let firstDivider = Int(formRequestInput.firstDivider),
            let secondDivider = Int(formRequestInput.secondDivider),
            let limit = Int(formRequestInput.limit)
        else {
            assertionFailure("FormRequestInput should be valid")
            return .failure(FormRequestInput.Error(errors: []))
        }
        let request = FizzBuzzRequest(
            firstDivider: firstDivider,
            secondDivider: secondDivider,
            limit: limit,
            firstText: formRequestInput.firstText,
            secondText: formRequestInput.secondText
        )
        return .success(request)
    }
}

extension FormRequestInput {

    struct Error: Swift.Error {
        let errors: [Kind]

        enum Kind {
            case invalidFirstDivider
            case invalidSecondDivider
            case invalidLimit
        }
    }
}
