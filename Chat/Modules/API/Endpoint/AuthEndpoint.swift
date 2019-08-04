//
//  AuthEndpoint.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

enum AuthEndpoint {
    case login
    case easyLogin
}

extension AuthEndpoint: Endpoint {
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .easyLogin:
            return "/auth/easy-login"
        }
    }

    var basePath: String {
        switch self {
        case .login:
            return APIConfig.shared.baseURL3
        case .easyLogin:
            return APIConfig.shared.baseURL3
        }
    }

    var method: HTTPMethod {
        switch self {
        case .easyLogin:
            return .get
        default:
            return .post
        }
    }

    var authNeeded: Bool {
        switch self {
        case .easyLogin:
            return true
        default:
            return false
        }
    }
}
