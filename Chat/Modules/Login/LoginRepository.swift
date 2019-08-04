//
//  LoginRepository.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import RxSwift

class LoginRepository {
    func login(mobileNumber: String, password: String) -> Observable<Result<LoginResponse>> {
        return APIManager
            .shared
            .login(mobileNumber: mobileNumber, password: password)
    }

    func easyLogin() -> Observable<Result<LoginResponse>> {
        return APIManager.shared.easyLogin()
    }
}
