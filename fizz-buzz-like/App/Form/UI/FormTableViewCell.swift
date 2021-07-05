//
//  FormTableViewCell.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation
import UIKit

private enum Constants {
    static let margin: CGFloat = 16.0
    static let height: CGFloat = 44.0
}

protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell,
                           with id: FormCellViewModel.Identifier,
                           valueDidChange newValue: String)
}

class FormTableViewCell: UITableViewCell {

    weak var delegate: FormTableViewCellDelegate?

    private var id: FormCellViewModel.Identifier?
    private lazy var textField = self.createTextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func configure(with viewModel: FormCellViewModel) {
        id = viewModel.id
        // keyboard type is .numbersAndPunctuation to allow negative numbers
        textField.keyboardType = .numbersAndPunctuation
        textField.placeholder = viewModel.title
        textField.text = viewModel.value
    }

    // MARK: - Private

    private func setup() {
        selectionStyle = .none
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.margin
            ),
            textField.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.margin
            ),
            textField.heightAnchor.constraint(equalToConstant: Constants.height),
        ])
    }

    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(textFieldValueDidChange), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        return textField
    }

    @objc private func textFieldValueDidChange() {
        guard let id = self.id, let text = textField.text else {
            assertionFailure("Should not happen")
            return
        }
        delegate?.formTableViewCell(self, with: id, valueDidChange: text)
    }
}
