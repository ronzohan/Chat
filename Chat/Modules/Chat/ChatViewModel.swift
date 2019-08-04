//
//  ChatViewModel.swift
//  Chat
//
//  Created by Ron Daryl Magno on 04/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SocketIO

class ChatViewModel {
    private lazy var manager = SocketManager(socketURL: SocketEndpoint.chatSocket.url,
                                        config: [.log(false),
                                                 .compress,
                                                 .extraHeaders(SocketEndpoint.chatSocket.commonHeader)])

    private lazy var socket: SocketIOClient = {
        return manager.defaultSocket
    }()

    func subscribeToSocket() {
        socket.on(clientEvent: .connect) { (data, ack) in
            debugPrint(data)
        }

        socket.onAny { event in
            debugPrint(event.items)
        }

        socket.connect()
    }
}
