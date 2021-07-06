//
//  FormViewController.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation
import UIKit

private enum Constants {
    static let horizontalMargin: CGFloat = 16.0
    static let verticalMargin: CGFloat = 32.0
    static let buttonHeight: CGFloat = 44.0
}

class FormViewController: UIViewController, FormViewContract {

    var presenter: FormPresenter?

    private var viewModel = FormViewModel(cells: [])
    private lazy var tableView = self.createTableView()
    private lazy var computeButton = self.createComputeButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - FormViewContract

    func display(viewModel: FormViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }

    func displayError(_ error: AppError) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Private

    private func setup() {
        view.backgroundColor = .systemBackground
        title = "New request"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(computeButton)
        computeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            computeButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -Constants.verticalMargin
            ),
            computeButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.horizontalMargin
            ),
            computeButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.horizontalMargin
            ),
            computeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
        ])
        setupNavBar()
    }

    private func setupNavBar() {
        let statsButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.slash.minus"),
            style: .plain,
            target: self,
            action: #selector(didSelectStatsButton)
        )
        navigationItem.rightBarButtonItem = statsButton
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(
            FormTableViewCell.self,
            forCellReuseIdentifier: FormTableViewCell.reusableId
        )
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }

    private func createComputeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Compute", for: .normal)
        button.addTarget(self, action: #selector(didSelectComputeButton), for: .touchUpInside)
        return button
    }

    @objc private func didSelectComputeButton() {
        presenter?.compute()
    }

    @objc private func didSelectStatsButton() {
        presenter?.requestStatistics()
    }
}

extension FormViewController: UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cells[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FormTableViewCell.reusableId
        ) as? FormTableViewCell else {
            assertionFailure("Should not happen")
            return UITableViewCell()
        }
        cell.delegate = self
        cell.configure(with: cellViewModel)
        return cell
    }
}

extension FormViewController: FormTableViewCellDelegate {

    // MARK: - FormTableViewCellDelegate

    func formTableViewCell(_ cell: FormTableViewCell,
                           with id: FormCellViewModel.Identifier,
                           valueDidChange newValue: String) {
        presenter?.value(for: id, didChange: newValue)
    }
}

private extension FormTableViewCell {

    static let reusableId = "FormTableViewCell"
}
