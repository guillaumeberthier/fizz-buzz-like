//
//  StatisticsPartView.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 08/07/2021.
//

import Foundation
import UIKit

private enum Constants {
    static let margin: CGFloat = 16.0
}

protocol StatisticsPartViewDelegate: AnyObject {
    func statisticsPartView(_ view: UIView, willLayoutWithRatio ratio: Double)
}

class StatisticsPartView: UIView {

    weak var delegate: StatisticsPartViewDelegate?

    private lazy var titleLabel = self.createTitleLabel()
    private var ratio: Double = 0.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.statisticsPartView(self, willLayoutWithRatio: ratio)
    }

    func configure(with viewModel: StatisticsViewModel.Part) {
        titleLabel.text = viewModel.title
        titleLabel.textColor = viewModel.titleColor
        backgroundColor = viewModel.backgroundColor
        ratio = viewModel.ratio
    }

    // MARK: - Private

    private func setup() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.margin),
            // This constraint may be broken if this view has not enough height to be laid out
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: Constants.margin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.margin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.margin),
        ])
    }

    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
}
