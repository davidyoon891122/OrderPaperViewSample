//
//  RightInfoView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/30.
//

import UIKit
import SnapKit

enum Section: String, CaseIterable, Hashable {
    case main
}


enum Item: Hashable {
    case first(FirstInfoData)
    case second(SecondInfoData)
}

final class RightInfoView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            FirstInfoCell.self,
            forCellWithReuseIdentifier: FirstInfoCell.identifier
        )
        collectionView.register(
            SecondInfoCell.self,
            forCellWithReuseIdentifier: SecondInfoCell.identifier
        )
        
        return collectionView
    }()
    
    
    private lazy var fiftyTwoWeekHighTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .lightGray
        label.text = "52 Week\nHigh"
        
        return label
    }()
    
    private lazy var fiftyTwoWeekHighValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .medium)
        label.textColor = .label
        label.text = "19.6837"
        
        return label
    }()
    
    private lazy var fiftyTwoWeekLowTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .lightGray
        label.text = "52 Week\nLow"
        
        
        
        return label
    }()
    
    private lazy var fiftyTwoWeekLowValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .medium)
        label.textColor = .label
        label.text = "6.0945"
        
        return label
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RightInfoView {
    func setupViews() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let configure = UICollectionViewCompositionalLayoutConfiguration()

        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = .paging
            
            return section
            
        }, configuration: configure)
        
        return layout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item> (collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            switch item {
                
            case .first(_):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstInfoCell.identifier, for: indexPath) as? FirstInfoCell else { return UICollectionViewCell() }
                return cell
            case .second(_):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondInfoCell.identifier, for: indexPath) as? SecondInfoCell else { return UICollectionViewCell() }
                return cell
            }
            
        })
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        
        snapshot.appendItems([.first(FirstInfoData.item), .second(SecondInfoData.item)])
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}



#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct RightInfoViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            RightInfoView()
        }
        .frame(width: Constants.OrderPaper.volumeViewWidth, height: 300.0)
    }
}


#endif

