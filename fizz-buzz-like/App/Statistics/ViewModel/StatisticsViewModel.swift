//
//  StatisticsViewModel.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation
import UIKit

/// Representation of a statistics part of all the requests.
/// If some requests have been computed: *requestViewModels* contains the favorite requests (or the only one) parts with its number of hits
/// and an other part to represent number of hits of all the other requests;
/// Otherwise: *requestViewModels* contains a single empty part.
struct StatisticsViewModel {

    /// Requests ratio sum is always equal to 1.0
    let requestViewModels: [Part]

    struct Part {

        let backgroundColor: UIColor

        let title: String
        let titleColor: UIColor

        /// from 0 to 1.0
        let ratio: Double
    }
}
