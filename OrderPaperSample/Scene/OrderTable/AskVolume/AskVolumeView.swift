//
//  AskVolumeView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/04/11.
//

import UIKit
import SnapKit

final class AskVolumeView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            AskVolumeCell.self,
            forCellWithReuseIdentifier: AskVolumeCell.identifier
        )
        
        collectionView.isScrollEnabled = false
        
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

private extension AskVolumeView {
    func setupViews() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(Constants.OrderPaper.volumeViewWidth), heightDimension: .absolute(300)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        })
        
        return layout
    }
    
    func configurationDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AskVolumeCell.identifier, for: indexPath) as? AskVolumeCell else { return UICollectionViewCell() }
            
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

struct AskVolumeViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            AskVolumeView()
        }
        .frame(width: Constants.OrderPaper.volumeViewWidth, height: 300.0)
    }
}

#endif
