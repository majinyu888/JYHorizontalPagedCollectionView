//
//  ViewController.swift
//  JYHorizontalPagedCollectionView
//
//  Created by hb on 2017/11/6.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBs
    let items = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12",
        "13"
    ]
    var pageCount = 0
    var collectionView: UICollectionView! = nil
    var screenWidth: CGFloat = UIScreen.main.bounds.size.width
    
    //MARK: - Public Models
    
    //MARK: - Private Models
    
    //MARK: - Public UIs
    
    //MARK: - Private UIs
    
    //MARK: - CustomFunction
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = JYCollectionViewHorizontalLayout()
        layout.row_count = 3
        layout.item_count_per_row = 2
        
        pageCount = items.count
        
        /// 直到可以被整除为止
        while pageCount % (layout.row_count * layout.item_count_per_row) != 0 {
            pageCount += 1
        }
        
        layout.itemSize = CGSize(width: screenWidth / CGFloat(layout.item_count_per_row), height: screenWidth / CGFloat(layout.row_count))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = .zero
        layout.scrollDirection = .horizontal
        let rect =  CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        collectionView.register(JYCollectionViewNomalCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(JYCollectionViewWhiteCell.self, forCellWithReuseIdentifier: "WhiteCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item > items.count - 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WhiteCell", for: indexPath)
            cell.backgroundColor = UIColor.brown
            print(cell.frame)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! JYCollectionViewNomalCell
            cell.lbl.text = "\(items[indexPath.item])"
            cell.backgroundColor = UIColor.cyan
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item > items.count - 1 {
            print("空白点击, 不需要处理")
        } else {
            print(indexPath.item)
        }
    }
}

