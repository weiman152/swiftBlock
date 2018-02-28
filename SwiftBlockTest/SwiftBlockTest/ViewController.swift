//
//  ViewController.swift
//  SwiftBlockTest
//
//  Created by iOS on 2018/2/28.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextAction(_ sender: Any) {
        let vc = NextViewController.instance()
        //5.这里调用的是以block为参数的方法，block中带有回调的参数
        vc.myBlockFunc {[weak self] (string) in
            self?.showTextLabel.text = string
        }
        present(vc, animated: true, completion: nil)
    }
    
}

