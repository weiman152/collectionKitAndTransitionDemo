//
//  HomeMallFinishCell.swift
//  CollectionKitDemo
//
//  Created by iOS on 2018/10/19.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit
import SnapKit

class HomeMallFinishCell: DynamicView {

    private lazy var titleLabel: UILabel = {
        $0.text = "防晒乳"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return $0
    }( UILabel() )
    
    private lazy var lowestPriceLabel: UILabel = {
        $0.text = "最低成交价"
        $0.textColor = UIColor.lightGray
        $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return $0
    }( UILabel() )
    
    private lazy var priceLabel: UILabel = {
        $0.text = "￥666"
        $0.textColor = UIColor.gray
        $0.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        return $0
    }( UILabel() )
    
    private lazy var originalPriceLabel: UILabel = {
        $0.text = "￥999"
        $0.textColor = UIColor.lightGray
        $0.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        return $0
    }( UILabel() )
    
    private lazy var statusLabel: UILabel = {
        $0.text = "已结束"
        $0.textColor = UIColor.gray
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return $0
    }( UILabel() )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func setup() {
        addSubview(titleLabel)
        addSubview(lowestPriceLabel)
        addSubview(originalPriceLabel)
        addSubview(priceLabel)
        addSubview(statusLabel)
        
    }
    
    private func setupLayout() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.right.equalTo(10)
        }
        
        statusLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.bottom.equalTo(-20)
        }
        
        originalPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(priceLabel.snp.right)
            make.centerY.equalTo(priceLabel.snp.centerY)
            make.right.greaterThanOrEqualTo(statusLabel.snp.left).offset(0)
        }
        
        lowestPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(priceLabel.snp.left).offset(5)
            make.bottom.equalTo(priceLabel.snp.top).offset(-10)
        }
        
    }
    
}
