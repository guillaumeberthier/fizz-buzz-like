//
//  StatisticsViewModelMapper.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation
import UIKit

struct StatisticsViewModelMapper {

    func map(countStatistics: FizzBuzzRequestCountStatistics) -> StatisticsViewModel {
        guard countStatistics.totalCount >= countStatistics.count else {
            assertionFailure("Should not happen")
            return StatisticsViewModel(requestViewModels: [])
        }
        let partRatio = Double(countStatistics.count) / Double(countStatistics.totalCount)
        var parts: [StatisticsViewModel.Part] = countStatistics.values.map {
            let partBgColor = UIColor.randomColor
            return StatisticsViewModel.Part(
                backgroundColor: partBgColor,
                title: $0.description(ratio: partRatio, count: countStatistics.count),
                titleColor: .label,
                ratio: partRatio
            )
        }
        if countStatistics.totalCount > 0 {
            let otherBgColor = UIColor.randomColor
            // 1.0 minus the ratio parts of all the favorite requests
            let otherRatio = 1.0 - (partRatio * Double(countStatistics.values.count))
            let otherPart = StatisticsViewModel.Part(
                backgroundColor: otherBgColor,
                title: "\("statistics_other".localized()), \(otherRatio.percentage)",
                titleColor: .label,
                ratio: otherRatio
            )
            parts.append(otherPart)
        }
        return StatisticsViewModel(requestViewModels: parts)
    }
}

private extension FizzBuzzRequest {

    func description(ratio: Double, count: Int) -> String {
        return """
        (\(firstDivider), \(secondDivider)), \
        l: \(limit), \
        (\(firstText), \(secondText)), \
        x\(count) (\(ratio.percentage))
        """
    }
}

private extension Double {

    var percentage: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        return numberFormatter.string(from: NSNumber(floatLiteral: self)) ?? ""
    }
}
