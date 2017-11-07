//
//  JYCollectionViewWhiteCell.swift
//  JYHorizontalPagedCollectionView
//
//  Created by hb on 2017/11/7.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

class JYCollectionViewWhiteCell: JYCollectionViewNomalCell {
    
    //MARK: - Public Models
    
    //MARK: - Private Models
    
    //MARK: - Public UIs
    
    //MARK: - Private UIs
    
    //MARK: - CustomFunction
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
