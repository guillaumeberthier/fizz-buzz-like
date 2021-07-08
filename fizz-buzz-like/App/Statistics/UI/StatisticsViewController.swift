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

    private lazy var stackView = self.createStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - StatisticsViewContract

    func display(viewModel: StatisticsViewModel) {
        stackView.removeAllSubviews()
        for partViewModel in viewModel.requestViewModels {
            let partView = StatisticsPartView(frame: .zero)
            partView.delegate = self
            partView.configure(with: partViewModel)
            stackView.addArrangedSubview(partView)
            partView.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    // MARK: - Private

    private func setup() {
        title = "statistics_title".localized()
        view.backgroundColor = .systemBackground
        edgesForExtendedLayout = []
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }
}

extension StatisticsViewController: StatisticsPartViewDelegate {

    // MARK: - StatisticsPartView

    func statisticsPartView(_ view: UIView, willLayoutWithRatio ratio: Double) {
        guard ratio > 0 else {
            return
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        let stackViewHeight = stackView.bounds.height
        let partViewHeight = stackViewHeight * CGFloat(ratio)
        view.heightAnchor.constraint(equalToConstant: partViewHeight).isActive = true
    }
}
