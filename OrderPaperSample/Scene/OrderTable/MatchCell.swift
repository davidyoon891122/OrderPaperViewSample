//
//  MatchCell.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/31.
//

import UIKit
import SnapKit

final class MatchCell: UICollectionViewCell {
    static let identifier = "MatchCell"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MatchCell {
    func setupView() {
        
    }
}
