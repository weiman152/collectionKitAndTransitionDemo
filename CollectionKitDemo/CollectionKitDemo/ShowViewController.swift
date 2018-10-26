//
//  ShowViewController.swift
//  CollectionKitDemo
//
//  Created by iOS on 2018/10/24.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
    
    class func instance() -> ShowViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ShowViewController") as! ShowViewController
        return vc
    }

}
