//
//  FormViewController.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation
import UIKit

class FormViewController: UIViewController, FormViewContract {

    var presenter: FormPresenter?

    private var viewModel = FormViewModel(cells: [])
    private lazy var tableView = self.createTableView()

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

    // MARK: - Private

    private func setup() {
        view.backgroundColor = .systemBackground
        title = "New request"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
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
