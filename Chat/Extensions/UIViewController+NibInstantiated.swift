//
//  UIViewController+NibInstantiated.swift
//  Chat
//
//  Created by Ron Daryl Magno on 02/08/2019.
//  Copyright © 2019 Ron Daryl Magno. All rights reserved.
//

import Foundation
import UIKit

protocol NibInstantiated {
    static var identifier: String { get }
}

extension NibInstantiated where Self: UIViewController {
    static var identifier: String {
        return String(describing: self)
    }

    static func instantiateFromNib(nibName: String? = identifier,
                                   bundle: Bundle = .main) -> Self {
        let viewController = Self(nibName: nibName, bundle: bundle)
        return viewController
    }
}

extension UIViewController: NibInstantiated {}
