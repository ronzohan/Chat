//
//  ChatViewController.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {
    var viewModel: ChatViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.subscribeToSocket()

        
    }
}
