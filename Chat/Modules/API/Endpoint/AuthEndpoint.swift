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
}

extension AuthEndpoint: Endpoint {
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        }
    }

    var method: HTTPMethod {
        return .post
    }

    var authNeeded: Bool {
        return false
    }
}
