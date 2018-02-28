//
//  StoryBoard.swift
//  SwiftBlockTest
//
//  Created by iOS on 2018/2/28.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

enum StoryBoard: String {
    case main       =       "Main"
    case index      =       "Index"
    case video      =       "Video"
    
    var storyBoard: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func instance<T>() -> T {
        return storyBoard.instantiateViewController(
            withIdentifier: String(describing: T.self)) as! T
    }
}
