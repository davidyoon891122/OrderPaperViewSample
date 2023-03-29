//
//  BidVolumeView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class BidVolumeView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            BidVolumeCell.self,
            forCellWithReuseIdentifier: BidVolumeCell.identifier
        )
        
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, VolumeData>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configurationDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BidVolumeView {
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
    
    func configurationDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BidVolumeCell.identifier, for: indexPath) as? BidVolumeCell else { return UICollectionViewCell() }
            cell.setupCell()
            
            return cell
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, VolumeData>()
        snapshot.appendSections([0])
        snapshot.appendItems(VolumeData.allItem)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}


#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct BidVolumeViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            BidVolumeView()
        }
        .frame(width: Constants.OrderPaper.volumeViewWidth, height: 300.0)
    }
}


#endif
