//
//  LoginViewModel.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel {
    struct Input {
        let login: PublishSubject<Void>
        let mobileNumber: PublishSubject<String>
        let password: PublishSubject<String>
    }

    struct Output {

    }

    private let disposeBag = DisposeBag()
    let input: Input
    let output: Output

    private let loginSubject = PublishSubject<Void>()
    private let mobileNumberSubject =  PublishSubject<String>()
    private let passwordSubject = PublishSubject<String>()

    private let repository: LoginRepository

    init(repository: LoginRepository) {
        self.repository = repository
        input = Input(login: loginSubject.asObserver(),
                      mobileNumber: mobileNumberSubject.asObserver(),
                      password: passwordSubject.asObserver())
        output = Output()
        setupBinding()
    }

    private func setupBinding() {
        loginSubject
            .withLatestFrom(Observable.combineLatest(mobileNumberSubject, passwordSubject))
            .flatMap { [repository] in repository.login(mobileNumber: $0, password: $1) }
            .subscribe(onNext: { result in
                switch result {
                case .success(let response):
                    debugPrint(response)
                case .failure:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
