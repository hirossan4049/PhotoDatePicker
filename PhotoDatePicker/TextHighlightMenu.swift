//
//  TextHighlightMenu.swift
//  PhotoDatePicker
//
//  Created by craptone on 2021/06/08.
//

import UIKit

class TextHighlightMenu: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    private let lists = ["6/15", "7/15", "8/15", "9/15", "10/15", "fff"]
//    var collView: UICollectionView!
    private lazy var collectionView: UICollectionView = {
        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        //各々の設計に合わせて調整
        layout.scrollDirection = .horizontal
        let margin:CGFloat = 30
        layout.minimumInteritemSpacing = margin
        layout.minimumLineSpacing = margin
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.estimatedItemSize = .zero
        layout.itemSize = CGSize(width: 64, height: bounds.height)

        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
        //セルの登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    private var selectedView: UIView!
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        clipsToBounds = true
        layer.cornerRadius = bounds.height / 2
        
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.invalidateLayout()
        }
        collectionView.showsHorizontalScrollIndicator = false
        
        selectedView = UIView(frame: CGRect(origin: CGPoint(x: 4, y: 4), size: CGSize(width: 64, height: bounds.height - 8)))
        selectedView.layer.cornerRadius = (bounds.height - 8) / 2
        selectedView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        collectionView.addSubview(selectedView)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//        return CGSize(width: 64, height: 1)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        cell.frame.size.width = 64
        cell.titleLabel.text = lists[indexPath.row]
//        let cellText = fruits[indexPath.item]
//        cell.setupContents(textName: cellText)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.selectedView.center = cell!.center
        })

    }
    

    

}


fileprivate final class CollectionViewCell: UICollectionViewCell {
    var titleLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel(frame: bounds)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .gray
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
