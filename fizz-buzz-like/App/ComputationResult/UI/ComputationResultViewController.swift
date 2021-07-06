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
    private lazy var loadingView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - ComputationResultViewContract

    func display(viewModel: ComputationResultViewModel) {
        textView.text = viewModel.text
    }

    func showLoading() {
        loadingView.startAnimating()
    }

    func hideLoading() {
        loadingView.stopAnimating()
    }

    // MARK: - Private

    private func setup() {
        title = "Fizz Buzz result"
        view.backgroundColor = .systemBackground
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
