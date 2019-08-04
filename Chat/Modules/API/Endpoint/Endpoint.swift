//
//  Endpoint.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var authNeeded: Bool { get }
    var basePath: String { get }
    var url: URL { get }
}

extension Endpoint {
    var authNeeded: Bool {
        return true
    }

    var basePath: String {
        return APIConfig.shared.baseURL3
    }

    var commonHeader: [String: String] {
        return ["APPID": APIConfig.shared.appID,
                "platform": "ios",
                "version": APIConfig.shared.appVersion]
    }

    var url: URL {
        return URL(string: "\(basePath)\(path)")!
    }
}

