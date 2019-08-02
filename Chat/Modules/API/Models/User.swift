//
//  User.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

struct User: Codable {
    let _id, username, phone, firstName: String
    let lastName, createdAt, updatedAt, birthdate: String
    let country, coverPhotoUrl, profilePhotoUrl, city: String
    let emailVerified: Bool
    let verificationCode: String
    let isOnline, isActive, isAvailable, isVerified: Bool
    let phoneFormats: [String]
    let phoneCountry, wentOnlineDate, wentOfflineDate: String
    let isBlocked, hasChangedUsername: Bool
    let gender, subscribersCount: Int
    let isFollowing, isFollower, isFriend: Bool
    let friendsCount: Int
    let about: String
}
