//
//  LoginViewModel.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    struct Input {
        let login: PublishSubject<Void>
        let mobileNumber: PublishSubject<String>
        let password: PublishSubject<String>
    }

    struct Output {
        let loginData: Driver<LoginData?>
    }

    private let disposeBag = DisposeBag()
    let input: Input
    let output: Output

    private let loginSubject = PublishSubject<Void>()
    private let mobileNumberSubject =  PublishSubject<String>()
    private let passwordSubject = PublishSubject<String>()

    private let loginDataSubject = PublishSubject<LoginData?>()

    private let repository: LoginRepository
    private let authManager: AuthManagerProtocol

    init(repository: LoginRepository, authManager: AuthManagerProtocol) {
        self.repository = repository
        self.authManager = authManager
        input = Input(login: loginSubject.asObserver(),
                      mobileNumber: mobileNumberSubject.asObserver(),
                      password: passwordSubject.asObserver())
        output = Output(loginData: loginDataSubject.asDriver(onErrorJustReturn: nil))
        setupBinding()
    }

    private func setupBinding() {
        loginSubject
            .withLatestFrom(Observable.combineLatest(mobileNumberSubject, passwordSubject))
            .flatMap { [repository] in repository.login(mobileNumber: $0, password: $1) }
            .do(onNext: { [weak self] result in
                switch result {
                case .success(let response):
                    self?.authManager.userToken = response.data.accessToken
                case .failure:
                    break
                }
            })
            .flatMap { [repository] _ in repository.easyLogin() }
            .subscribe(onNext: { [weak self] result in
                switch result {
                case .success(let response):
                    self?.loginDataSubject.onNext(response.data)
                case .failure:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
