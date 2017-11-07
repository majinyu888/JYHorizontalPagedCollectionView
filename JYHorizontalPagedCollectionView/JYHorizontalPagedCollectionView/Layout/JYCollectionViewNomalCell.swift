//
//  JYCollectionViewNomalCell.swift
//  JYHorizontalPagedCollectionView
//
//  Created by hb on 2017/11/7.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

class JYCollectionViewNomalCell: UICollectionViewCell {
    
    
    //MARK: - Public Models
    
    //MARK: - Private Models
    
    //MARK: - Public UIs
    
    let iv = UIImageView()
    let lbl = UILabel()
    let lbl_height: CGFloat = 20
    
    //MARK: - Private UIs
    
    //MARK: - CustomFunction
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iv.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height - lbl_height)
        contentView.addSubview(iv)
        
        lbl.frame = CGRect(x: 0, y: iv.frame.maxY, width: bounds.size.width, height: lbl_height)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.darkGray
        lbl.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(lbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
