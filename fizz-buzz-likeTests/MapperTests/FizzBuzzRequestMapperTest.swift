//
//  FizzBuzzRequestMapperTest.swift
//  fizz-buzz-likeTests
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import XCTest
@testable import fizz_buzz_like

private struct TestInputsFactory {

    static let inputs: [FormRequestInput] = [
        FormRequestInput(firstDivider: "3", secondDivider: "-5", limit: "16", firstText: "3trois", secondText: "5cinq"),
        FormRequestInput(firstDivider: "-3trois", secondDivider: "cinq", limit: "0", firstText: "a", secondText: "b"),
        FormRequestInput(
            firstDivider: "9223372036854775808", // Int.max + 1
            secondDivider: "9223372036854775808", // Int.max + 1
            limit: "\(Int.max)",
            firstText: "a",
            secondText: "b"
        ),
    ]

    static let expectedRequests: [Result<FizzBuzzRequest, FormRequestInput.Error>] = [
        .success(FizzBuzzRequest(firstDivider: 3, secondDivider: -5, limit: 16, firstText: "3trois", secondText: "5cinq")),
        .failure(FormRequestInput.Error(errors: [.invalidFirstDivider, .invalidSecondDivider, .invalidLimit])),
        .failure(FormRequestInput.Error(errors: [.invalidFirstDivider, .invalidSecondDivider])),
    ]
}

class FizzBuzzRequestMapperTest: XCTestCase {

    func testNominalCase() throws {
        let mapper = FizzBuzzRequestMapper()
        let result = mapper.map(formRequestInput: TestInputsFactory.inputs[0])
        XCTAssertEqual(result, TestInputsFactory.expectedRequests[0])
    }

    func testErrorsCase() throws {
        let mapper = FizzBuzzRequestMapper()
        let result = mapper.map(formRequestInput: TestInputsFactory.inputs[1])
        XCTAssertEqual(result, TestInputsFactory.expectedRequests[1])
    }

    func testOverflowErrorCase() throws {
        let mapper = FizzBuzzRequestMapper()
        let result = mapper.map(formRequestInput: TestInputsFactory.inputs[2])
        XCTAssertEqual(result, TestInputsFactory.expectedRequests[2])
    }
}
