//
//  APIConfig.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

class APIConfig {
    static let shared = APIConfig()

    public enum Environment: Int {
        case development
        case production
    }

    private let developmentBaseURL = "https://abcompany001.herokuapp.com/api/v1"
    private let productionBaseURL = "https://abcompany001.herokuapp.com/api/v1"

    var environment: Environment {
        #if DEVELOPMENT
        return .development
        #else
        return .production
        #endif
    }

    var baseURL: String {
        switch environment {
        case .development:
            return developmentBaseURL
        case .production:
            return productionBaseURL
        }
    }
}
