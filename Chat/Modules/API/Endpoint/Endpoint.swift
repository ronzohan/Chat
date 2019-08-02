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
}

extension Endpoint {
    var authNeeded: Bool {
        return true
    }
}