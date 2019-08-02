//
//  ResponseInfo.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

struct ResponseInfo: Codable {
    enum CodingKeys: String, CodingKey {
        case statusCode
        case message
        case error
    }

    let statusCode: Int
    let message: String
    let error: String?

    init(statusCode: Int, message: String, error: String? = nil) {
        self.statusCode = statusCode
        self.message = message
        self.error = error
    }
}
