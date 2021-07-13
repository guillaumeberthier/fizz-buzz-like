//
//  ComputationResultViewContract.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation

protocol ComputationResultViewContract: AnyObject, ErrorDisplayable {
    func showLoading()
    func hideLoading()
}
