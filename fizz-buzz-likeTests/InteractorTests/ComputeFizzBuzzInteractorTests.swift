//
//  ComputeFizzBuzzInteractorTests.swift
//  fizz-buzz-likeTests
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import XCTest
@testable import fizz_buzz_like

private struct TestWordsFactory {

    static let requests: [FizzBuzzRequest] = [
        FizzBuzzRequest(firstDivider: 3, secondDivider: 5, limit: 16, firstText: "fizz", secondText: "buzz"),
        FizzBuzzRequest(firstDivider: 0, secondDivider: 0, limit: 3, firstText: "fizz", secondText: "buzz"),
        FizzBuzzRequest(firstDivider: 2, secondDivider: -2, limit: 3, firstText: "fizz", secondText: "buzz"),
        FizzBuzzRequest(firstDivider: 2, secondDivider: 3, limit: 0, firstText: "fizz", secondText: "buzz"),
    ]

    static let expectedWords: [[String]] = [
        ["1", "2", "fizz", "4", "buzz", "fizz", "7", "8", "fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz", "16"],
        ["1", "2", "3"],
        ["1", "fizzbuzz", "3"],
        [],
    ]
}

class ComputeFizzBuzzInteractorTests: XCTestCase {

    private let requestRepository = MockFizzBuzzRequestRepository()

    func testNominalCase() throws {
        let interactor = ComputeFizzBuzzInteractorImplementation(requestRepository: requestRepository)
        interactor.execute(request: TestWordsFactory.requests[0]) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.words, TestWordsFactory.expectedWords[0])
            case .failure(let error):
                XCTFail("Expected success \(error)")
            }
        }
    }

    func testDivideByZero() throws {
        let interactor = ComputeFizzBuzzInteractorImplementation(requestRepository: requestRepository)
        interactor.execute(request: TestWordsFactory.requests[1]) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.words, TestWordsFactory.expectedWords[1])
            case .failure(let error):
                XCTFail("Expected success \(error)")
            }
        }
    }

    func testDivideByOppositeNumbers() throws {
        let interactor = ComputeFizzBuzzInteractorImplementation(requestRepository: requestRepository)
        interactor.execute(request: TestWordsFactory.requests[2]) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.words, TestWordsFactory.expectedWords[2])
            case .failure(let error):
                XCTFail("Expected success \(error)")
            }
        }
    }

    func testInvalidLimit() throws {
        let interactor = ComputeFizzBuzzInteractorImplementation(requestRepository: requestRepository)
        interactor.execute(request: TestWordsFactory.requests[3]) { result in
            switch result {
            case .success:
                XCTFail("Expected error \(AppError.invalidInput)")
            case .failure(let error):
                XCTAssertEqual(error, .invalidInput)
            }
        }
    }
}
