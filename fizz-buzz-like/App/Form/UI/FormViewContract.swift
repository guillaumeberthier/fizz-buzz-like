//
//  FormViewContract.swift
//  fizz-buzz-like
//
//  Created by Guillaume Berthier on 05/07/2021.
//

import Foundation

protocol FormViewContract: AnyObject {
    func display(viewModel: FormViewModel)
    func displayError(_ error: AppError)
}
