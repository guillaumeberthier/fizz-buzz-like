//
//  FizzBuzzRequestVolatileRepositoryTests.swift
//  fizz-buzz-likeTests
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import XCTest
@testable import fizz_buzz_like

private struct TestRequestsFactory {

    static let requests: [FizzBuzzRequest] = [
        FizzBuzzRequest(firstDivider: 3, secondDivider: 5, limit: 16, firstText: "a", secondText: "b"),
        FizzBuzzRequest(firstDivider: 0, secondDivider: 0, limit: 3, firstText: "c", secondText: "d"),
        FizzBuzzRequest(firstDivider: 2, secondDivider: -2, limit: 3, firstText: "e", secondText: "f"),
    ]
}

class FizzBuzzRequestVolatileRepositoryTests: XCTestCase {

    private let requestRepository = FizzBuzzRequestVolatileRepository()

    func testAddAndStatisticsBehavior() throws {
        let addRequestExpectation = XCTestExpectation(description: "add completion")
        let getStatsExpectation = XCTestExpectation(description: "favoriteRequestStatistics completion")

        // Check empty state
        requestRepository.favoriteRequestStatistics { result in
            XCTAssertEqual(result, .success(FizzBuzzRequestCountStatistics(values: [], count: 0, totalCount: 0)))
            getStatsExpectation.fulfill()
        }
        wait(for: [getStatsExpectation], timeout: 5.0)

        // Add 5 requests
        requestRepository.add(request: TestRequestsFactory.requests[0]) { _ in
            requestRepository.add(request: TestRequestsFactory.requests[1]) { _ in
                requestRepository.add(request: TestRequestsFactory.requests[2]) { _ in
                    requestRepository.add(request: TestRequestsFactory.requests[1]) { _ in
                        requestRepository.add(request: TestRequestsFactory.requests[0]) { _ in
                            addRequestExpectation.fulfill()
                        }
                    }
                }
            }
        }
        wait(for: [addRequestExpectation], timeout: 5.0)

        // Check 0 and 1 are the two most favorites requests
        let expectedResult: Result<FizzBuzzRequestCountStatistics, AppError> = .success(
            FizzBuzzRequestCountStatistics(
                values: [TestRequestsFactory.requests[0], TestRequestsFactory.requests[1]],
                count: 2,
                totalCount: 5
            )
        )
        requestRepository.favoriteRequestStatistics { result in
            XCTAssertEqual(result, expectedResult)
        }
    }
}
