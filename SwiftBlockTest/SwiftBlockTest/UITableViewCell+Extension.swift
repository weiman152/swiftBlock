//
//  UITableViewCell+Extension.swift
//  SwiftBlockTest
//
//  Created by iOS on 2018/2/28.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
