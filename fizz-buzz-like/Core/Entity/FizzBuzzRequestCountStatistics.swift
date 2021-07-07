//
//  FizzBuzzRequestCountStatistics.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

struct FizzBuzzRequestCountStatistics: Equatable {

    /// The fizz buzz requests that have been the most requested
    let values: [FizzBuzzRequest]

    /// That request count
    let count: Int

    /// All requests count
    let totalCount: Int
}
