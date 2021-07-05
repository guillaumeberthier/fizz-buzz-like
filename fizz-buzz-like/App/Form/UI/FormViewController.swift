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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - FormViewContract

    func display(viewModel: FormViewModel) {
        // TODO (Guillaume Berthier) Configure view
    }

    // MARK: - Private

    private func setup() {
        view.backgroundColor = .systemBackground
        title = "New request"
    }
}
