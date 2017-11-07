//
//  JYCollectionViewHorizontalLayout.swift
//  JYHorizontalPagedCollectionView
//
//  Created by hb on 2017/11/6.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

/// 布局类
class JYCollectionViewHorizontalLayout: UICollectionViewFlowLayout {
    
    //MARK: - Public Models
    public var item_count_per_row = 4
    public var row_count = 2
    public var allAttributes = [UICollectionViewLayoutAttributes]()
    
    //MARK: - CustomFunction
    
    /// 根据item,计算目标item的位置
    ///
    /// - Parameters:
    ///   - item: item
    ///   - resultX: 横向偏移的x
    ///   - resultY: 竖向偏移的y
    fileprivate func targetPosition(with item: Int, resultX: inout Int, resultY: inout Int) {
        let page = item / (item_count_per_row * row_count)
        let theX = item % item_count_per_row + page * item_count_per_row
        let theY = item / item_count_per_row - page * row_count
        resultX = theX
        resultY = theY
    }
    
    /// 根据偏移量计算原来的item
    ///
    /// - Parameters:
    ///   - x: 偏移后的x
    ///   - y: 偏移后的y
    /// - Returns: 原来的item
    fileprivate func originItem(at x: Int, y: Int) -> Int {
        return x * row_count + y
    }
    
    //MARK: - Life Cycle
    
    override func prepare() {
        super.prepare()
        if let count = collectionView?.numberOfItems(inSection: 0) {
            for i in 0..<count {
                let indexPath = IndexPath(item: i, section: 0)
                if let attribute = layoutAttributesForItem(at: indexPath) {
                    allAttributes.append(attribute)
                }
            }
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return super.collectionViewContentSize
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let item = indexPath.item
        var x = 0
        var y = 0
        targetPosition(with: item, resultX: &x, resultY: &y)
        let item2 = originItem(at: x, y: y)
        let newIndexPath = IndexPath(item: item2, section: 0)
        let theNewAttribute = super.layoutAttributesForItem(at: newIndexPath)
        theNewAttribute?.indexPath = indexPath
        return theNewAttribute
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var tmp = [UICollectionViewLayoutAttributes]()
        if let attributes = super.layoutAttributesForElements(in: rect) {
            for attr in attributes {
                for attr2 in allAttributes {
                    if attr.indexPath.item == attr2.indexPath.item {
                        tmp.append(attr2)
                        break
                    }
                }
            }
        }
        return tmp
    }
}
