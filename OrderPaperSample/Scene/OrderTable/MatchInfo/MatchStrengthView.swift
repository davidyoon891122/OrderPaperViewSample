//
//  MatchStrengthView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/31.
//

import UIKit
import SnapKit

enum MatchStrengthSection: CaseIterable, Hashable {
    case main
}

enum MatchInfoItem: Hashable {
    case first(MatchInfoData)
    case second(ProfitData)
}

final class MatchStrengthView: UIView {
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .label
        pageControl.numberOfPages = 2
        
        pageControl.isUserInteractionEnabled = false
        
        return pageControl
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            MatchContainerCell.self,
            forCellWithReuseIdentifier: MatchContainerCell.identifier
        )
        collectionView.register(
            ProfitViewCell.self,
            forCellWithReuseIdentifier: ProfitViewCell.identifier
        )
        
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<MatchStrengthSection, MatchInfoItem>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MatchStrengthView {
    func setupViews() {
        [
            pageControl,
            collectionView
        ]
            .forEach {
                addSubview($0)
            }
        
        pageControl.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(10.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {

            $0.top.equalTo(pageControl.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(Constants.OrderPaper.volumeViewWidth), heightDimension: .fractionalHeight(1)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = .paging
            
            section.visibleItemsInvalidationHandler = { item, offset, env in
                let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
                self.pageControl.currentPage = index
            }
            
            return section
            
        })
        
        return layout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<MatchStrengthSection, MatchInfoItem>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            switch item {
            case .first(_):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchContainerCell.identifier, for: indexPath) as? MatchContainerCell else { return UICollectionViewCell() }
                
                return cell
            case .second(_):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfitViewCell.identifier, for: indexPath) as? ProfitViewCell else { return UICollectionViewCell() }
                return cell
            }
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<MatchStrengthSection, MatchInfoItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems([.first(MatchInfoData.item), .second(ProfitData.item)])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MatchStrengthViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            MatchStrengthView()
        }
        .frame(width: Constants.OrderPaper.volumeViewWidth, height: 300.0)
    }
}
#endif
