//
//  StatisticsViewContract.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation

protocol StatisticsViewContract: AnyObject, ErrorDisplayable {
    func display(viewModel: StatisticsViewModel)
}
