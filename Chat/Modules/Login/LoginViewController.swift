//
//  LoginViewController.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    var viewModel: LoginViewModel?
    let disposeBag = DisposeBag()

    @IBOutlet var mobileNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }

    private func setupViewModel() {
        guard let viewModel = viewModel else { return }

        mobileNumberTextField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.input.mobileNumber)
            .disposed(by: disposeBag)

        passwordTextField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.input.password)
            .disposed(by: disposeBag)

        loginButton.rx.tap
            .bind(to: viewModel.input.login)
            .disposed(by: disposeBag)
    }
}
