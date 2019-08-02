//
//  LoginResponse.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case data
    }

    let info: ResponseInfo
    let data: LoginData

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(LoginData.self, forKey: CodingKeys.data)
        info = try ResponseInfo(from: decoder)
    }
}
