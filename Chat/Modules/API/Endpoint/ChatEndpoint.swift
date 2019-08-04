//
//  ChatEndpoint.swift
//  Chat
//
//  Created by Ron Daryl Magno on 04/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation

enum ChatEndpoint {
    case chatSocket
}

extension ChatEndpoint: Endpoint {
    var path: String {
        switch self {
        case .chatSocket:
            return "/socket.io/?transport=polling&b64=1"
        }
    }

    var method: HTTPMethod {
        return .post
    }

    var authNeeded: Bool {
        return false
    }
}
