//
//  StatisticsViewController.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 07/07/2021.
//

import Foundation
import UIKit

class StatisticsViewController: UIViewController, StatisticsViewContract {

    var presenter: StatisticsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }

    // MARK: - StatisticsViewContract

    func display(viewModel: StatisticsViewModel) {
    }
}
