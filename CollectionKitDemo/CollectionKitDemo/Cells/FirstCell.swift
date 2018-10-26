//
//  FirstCell.swift
//  CollectionKitDemo
//
//  Created by iOS on 2018/10/24.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class FirstCell: UIView {
    
    var label: UILabel = {
        $0.textAlignment = .center
        $0.backgroundColor = UIColor.randomColor
        return $0
    }( UILabel() )

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
        setupLayout()
    }
    
    private func setup() {
        addSubview(label)
    }
    
    private func setupLayout() {
        
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.layer.cornerRadius = label.bounds.size.width / 2.0
        label.layer.masksToBounds = true
    }
}
