//
//  WaterFallCell.swift
//  CollectionKitDemo
//
//  Created by iOS on 2018/10/24.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class WaterFallCell: DynamicView {
    
    private var coverImage: UIImageView = {
        return $0
    }( UIImageView() )
    
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
        
        backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        addSubview(coverImage)
        
        
    }
    
    private func setupLayout() {
        
        coverImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
}

extension WaterFallCell {
    
    func set(image: UIImage) {
        coverImage.image = image
    }
}
