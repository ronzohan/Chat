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

    private let developmentBaseURL = "https://sea6.api.deveyesin.com/api/v1"
    private let productionBaseURL = "https://sea6.api.deveyesin.com/api/v1"

    let appVersion = "1.0.63"

    var appID = """
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1MjYzNzM5NDQsImlzcyI6ImV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUpwWVhRaU9qRTFNall6TnpFM056TXNJbWx6Y3lJNklsQlhRMHB3VGpndlNrVkZSMmhTVm1VclV6ZENja1ZzVjJRdllVUndVME5rV0cweGFIbFZabGRrVjFCUlJtSXdUMU51VkdKd0wwdHlSVTh3TnpSU1p6bFhjSGxMU1ZaaFpXeE5NR1V6Y1RGRldqVlZNMWRYZW1JeVRuVk5VbkJXUVZWUFNIQmlZMk56TTJ3MFVYQnNaa2QyWlZOTk16TjJjVEJzVGxwVGNtczFTMkpOTUVOMWNDOXpTREk0TDFsamNGRmpWR3R1YUhwVU1HTTFjMjExV2lzdk5HNXJlUzlUTWxadmRIbHZXVzl4U2paVFEwOUNOMmR4U0Vkd1dYa3dUakI2WjJreWQyeERhWEI0TmtKemR6UlBiRmt6YWxaVGJVVTBRWG94YzBwb2RXZEZkbWhIVkVFeGRHRmhNbkp4UjBJeVN6TndRV3hhV2k5bWVYcHJjMVEyTUVObWVWWk9UbE5wZWt4RlZEbEVNRWx2VTFSNVRXUlhNMkozWXpReVNXRklRekZXTWpCTWJrUnBVVEJUVW1GbVZEZzFja1ZETmxoTE9WWkRMM2N5WjFsMFEzQnBiRmRUVUc1RWJ6Z3JibUZITUZvNFVUMDlJbjAuX1M4QWFIazJVbk51ZVlUOTRHcVU0TUpfT2N0bmpWOVVDNlRRUXR4dTJlZyJ9.nV9Bmkk9rBJLUOzeby-LoI3DpS9i2FD76G6H-Zvjytk
"""

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

    var baseURL3: String {
        return "https://sea3.api.deveyesin.com/api/v1"
    }
}
