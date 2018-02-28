//
//  UITableView+Extension.swift
//  SwiftBlockTest
//
//  Created by iOS on 2018/2/28.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    //想实现根据cell类名当作复用标识进行创建cell
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type,
                                                 indexPath: IndexPath) -> T{
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier,
                                   for: indexPath) as! T
    }
    
}
