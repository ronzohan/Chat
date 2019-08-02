//
//  ViewControllerFactory.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import UIKit

struct ViewControllerFactory {
    static func makeLoginViewController() -> LoginViewController {
        let viewController = LoginViewController.instantiateFromNib()
        return viewController 
    }
}
