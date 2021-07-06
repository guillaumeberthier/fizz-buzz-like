//
//  ComputationResultViewController.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 06/07/2021.
//

import Foundation
import UIKit

private enum Constants {
    static let margin: CGFloat = 16.0
}

class ComputationResultViewController: UIViewController, ComputationResultViewContract {

    var presenter: ComputationResultPresenter?

    private lazy var textView = self.createTextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.start()
    }

    // MARK: - ComputationResultViewContract

    func display(viewModel: ComputationResultViewModel) {
        textView.text = viewModel.text
    }

    // MARK: - Private

    private func setup() {
        title = "Fizz Buzz result"
        view.backgroundColor = .systemBackground
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func createTextView() -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .preferredFont(forTextStyle: .body)
        textView.contentInset = UIEdgeInsets(
            top: Constants.margin,
            left: Constants.margin,
            bottom: Constants.margin,
            right: Constants.margin
        )
        return textView
    }
}
