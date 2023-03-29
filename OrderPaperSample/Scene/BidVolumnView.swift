//
//  BidVolumnView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class BidVolumnView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            BidVolumnCell.self,
            forCellWithReuseIdentifier: BidVolumnCell.identifier
        )
        
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BidVolumnView {
    func setupViews() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        })
        
        return layout
    }
}


#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct BidVolumnViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            BidVolumnView()
        }
        .frame(width: UIScreen.main.bounds.width, height: 300.0)
    }
}


#endif
