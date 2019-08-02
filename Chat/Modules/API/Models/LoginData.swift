//
//  LoginData.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

struct LoginData: Codable {
    let id: String
    let userID: String
    let accessToken: String
    let refreshToken: String
    let pushToken: String?
    let voipToken: String?
    let platform: String?
    let updatedAt: String
    let createdAt: String
    let user: User
}
