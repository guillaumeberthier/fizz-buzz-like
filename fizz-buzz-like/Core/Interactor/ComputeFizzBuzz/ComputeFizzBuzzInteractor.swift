//
//  ComputeFizzBuzzInteractor.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

/// Compute *FizzBuzzRequest* and return a *FizzBuzzResponse* containing all the words.
/// See *FizzBuzzRequest* for more detail.
protocol ComputeFizzBuzzInteractor {

    // TODO (Guillaume Berthier) Handle progression
    func execute(request: FizzBuzzRequest, index: Int) -> FizzBuzzResponse
}
