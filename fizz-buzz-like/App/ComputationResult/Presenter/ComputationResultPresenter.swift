//
//  ComputationResultPresenter.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

protocol ComputationResultPresenter {
    var limit: Int { get }
    func compute(index: Int) -> String
}
