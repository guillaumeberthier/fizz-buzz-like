//
//  GetFavoriteFizzBuzzRequestsInteractor.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

protocol GetFavoriteFizzBuzzRequestsInteractor {
    func execute(completion: (Result<FizzBuzzRequestCountStatistics, AppError>) -> Void)
}
