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

    private lazy var tableView = self.createTableView()
    private lazy var loadingView = UIActivityIndicatorView(style: .large)

    private var viewModel = ComputationResultViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - ComputationResultViewContract

    func showLoading() {
        loadingView.startAnimating()
    }

    func hideLoading() {
        loadingView.stopAnimating()
    }

    // MARK: - Private

    private func setup() {
        title = "computation_result_title".localized()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        return tableView
    }
}

extension ComputationResultViewController: UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.limit ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let value = presenter?.compute(index: indexPath.row)
        cell?.textLabel?.text = value
        return cell ?? UITableViewCell()
    }
}
