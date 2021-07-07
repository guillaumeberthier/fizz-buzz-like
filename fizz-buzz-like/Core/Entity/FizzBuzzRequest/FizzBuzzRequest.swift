//
//  FizzBuzzRequest.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

/**
 Information to compute a fizz-buzz:
 from 1 to *limit*, if *firstDivider* divides current number, print *firstText*;
 If *secondDivider* divides current number, print *secondText*;
 Otherwise print current number.
 */
struct FizzBuzzRequest: Equatable {

    let firstDivider: Int

    let secondDivider: Int

    /// Greater than 0
    let limit: Int

    let firstText: String

    let secondText: String
}
