//
//  FirstViewController.swift
//  CollectionKitDemo
//
//  Created by iOS on 2018/10/24.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit
import CollectionKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    let ScreenWidth = UIScreen.main.bounds.size.width
    let MAXCOUNT = 6
    
    private var collection = CollectionView()
    private var dataSource = ArrayDataSource(data: [1, 2, 3])
    let viewSource = ClosureViewSource { (view: FirstCell, num: Int, index: Int) in
        view.label.text = "\(num)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
    }
    
    private func setup() {
        
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: (collectionSize.width - 20) / CGFloat(self.dataSource.data.count),
                height: (collectionSize.width - 20) / CGFloat(self.dataSource.data.count))
        }
        let layout = RowLayout(justifyContent: .center,
                               alignItems: .center)
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource,
            layout: layout,
            animator: WobbleAnimator(),
            tapHandler: { (context) in
                print("点击了view \(context)")
        })
        
        collection = CollectionView(provider: provider)
        collection.frame = topView.bounds
        collection.backgroundColor = UIColor.yellow
        collection.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        topView.addSubview(collection)
    }
    
    private func setupLayout() {
        
    }
    
    class func instance() -> FirstViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        return vc
    }
    
    @IBAction func add(_ sender: Any) {
        
        guard dataSource.data.count <= MAXCOUNT else {
            print("不能再增加了")
            return
        }
        
        dataSource.data.append(dataSource.data.count + 1)
        
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: (collectionSize.width - 20) / CGFloat(self.dataSource.data.count),
                          height: (collectionSize.width - 20) / CGFloat(self.dataSource.data.count))
        }
        let layout = RowLayout(justifyContent: .center,
                               alignItems: .center)
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource,
            layout: layout,
            animator: WobbleAnimator(),
            tapHandler: { (context) in
                print("点击了view \(context)")
        })
        collection.provider = provider
        
    }
    
    @IBAction func reduce(_ sender: Any) {
        guard dataSource.data.count > 1 else {
            print("不能再减少了")
            return
        }
        dataSource.data.removeLast()
    }
    
    @IBAction func showVC(_ sender: Any) {
        
        let vc = ShowViewController.instance()
        ScaleTransitionVC.pushWithScale(fromVC: self, toVC: vc)
    }
    
}

extension UIColor {
    
    static var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random_uniform(255)) / 255.0
            let green = CGFloat(arc4random_uniform(255)) / 255.0
            let blue = CGFloat(arc4random_uniform(255)) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
