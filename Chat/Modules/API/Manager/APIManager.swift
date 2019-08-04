//
//  APIManager.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import RxSwift
import SocketIO

class BaseAPIManager {
    let apiClient: APIClient

    init(client: APIClient = APIClient(authManager: AuthManager.shared)) {
        apiClient = client
    }

    func send<T: Codable>(endpoint: Endpoint, parameters: [String: Any]) -> Observable<Result<T>> {
        let request = APIRequest(endpoint: endpoint, parameters: parameters)
        return apiClient.send(request: request)
    }
}

class APIManager: BaseAPIManager {
    static let shared = APIManager()

    func login(mobileNumber: String, password: String) -> Observable<Result<LoginResponse>> {
        enum Parameters: String {
            case mobileNumber = "email"
            case password
        }

        let parameters: [String: Any] = [
            Parameters.mobileNumber.rawValue: mobileNumber,
            Parameters.password.rawValue: password,
        ]

        return send(endpoint: AuthEndpoint.login, parameters: parameters)
    }

    func easyLogin() -> Observable<Result<LoginResponse>> {
        return send(endpoint: AuthEndpoint.easyLogin, parameters: [:])
    }
}
