//
//  ViewController.swift
//  CollectionKitDemo
//
//  Created by iOS on 2018/10/19.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit
import CollectionKit

class ViewController: UIViewController {
    
    @IBOutlet weak var horizontalView: UIView!
    @IBOutlet weak var verticalView: UIView!
    @IBOutlet weak var waterView: UIView!
    
    private var collectionKit: CollectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        // 横向滑动的集合
        setHorizontalCollection()
        setVerticalCollection()
        setWaterFallCollection()
    }
        
}

extension ViewController {
    
    func setHorizontalCollection() {
        let dataSource = ArrayDataSource(data: [1, 2, 3, 4])
        let viewSource = ClosureViewSource { (view: HomeMallFinishCell, data: Int, index: Int) in
            view.backgroundColor = UIColor.white
        }
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: 150, height: 100)
        }
        let layout = RowLayout(fillIdentifiers: ["horizontal"],
                               spacing: 10,
                               justifyContent: .center,
                               alignItems: .center)
        
        let provider = BasicProvider(
            identifier: "horizontal",
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource,
            layout: layout,
            animator: WobbleAnimator(),
            tapHandler: {[weak self] (context) in
                self?.select(context.data)
        })
        
        let collection = CollectionView(provider: provider)
        collection.frame = horizontalView.bounds
        collection.backgroundColor = UIColor.yellow
        collection.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        horizontalView.addSubview(collection)
    }
    
    private func select(_ data: Int) {
        print("------ \(data)")
    }
    
    func setVerticalCollection() {
        let dataSource = ArrayDataSource(data: [1, 2, 3, 4, 5, 6, 7, 8, 9])
        let viewSource = ClosureViewSource { (view: UILabel, data: Int, index: Int) in
            view.backgroundColor = #colorLiteral(red: 0.9190374613, green: 0.660689652, blue: 0.6173325181, alpha: 1)
            view.text = "\(data)"
            view.textAlignment = .center
        }
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: (collectionSize.width - 10) / 2.0,
                          height: (collectionSize.width - 10) / 2.0)
        }
        let layout = FlowLayout(lineSpacing: 20,
                                interitemSpacing: 10,
                                justifyContent: .start,
                                alignItems: .center,
                                alignContent: .start)
        let provider = BasicProvider(
            identifier: "Vertical",
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource,
            layout: layout,
            animator: FadeAnimator()) { (context) in
             print("点击了cell \(context.data)")
        }
        
        let collection = CollectionView(provider: provider)
        collection.frame = verticalView.bounds
        verticalView.addSubview(collection)
        collection.backgroundColor = .red
        collection.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func setWaterFallCollection() {
        var array: [UIImage] = []
        for i in 1...11 {
            if let image = UIImage(named: "\(i)") {
                 array.append(image)
            }
        }
        
        let dataSource = ArrayDataSource(data: array)
        let viewSource = ClosureViewSource { (view: WaterFallCell, image: UIImage, index) in
            view.set(image: image)
        }
        let sizeSource = { (index: Int, data: UIImage, collectionSize: CGSize) -> CGSize in
            return CGSize(width: data.size.width / 3.0,
                          height: data.size.height / 3.0)
        }
        let layout = WaterfallLayout(columns: 2, spacing: 10)
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource,
            layout: layout,
            animator: WobbleAnimator()) { (context) in
                print("瀑布流点击 \(context.data)")
        }
        
        let collection = CollectionView(provider: provider)
        collection.frame = waterView.bounds
        waterView.addSubview(collection)
        collection.backgroundColor = #colorLiteral(red: 0.8755514721, green: 0.9739040799, blue: 1, alpha: 1)
    }
}

