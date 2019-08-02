//
//  UIViewController+NibInstantiated.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiateFromNib<T: UIViewController>(nibName: String? = String(describing: self),
                                                        bundle: Bundle = .main) -> T {
        let viewController = T(nibName: nibName, bundle: bundle)
        return viewController
    }
}
