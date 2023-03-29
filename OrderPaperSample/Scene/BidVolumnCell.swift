//
//  BidVolumnCell.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class BidVolumnCell: UICollectionViewCell {
    static let identifier = "BidVolumnCell"
    
    private lazy var volumnLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .label
        label.text = "3,420"
        label.textAlignment = .right
        
        return label
    }()
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        [
            volumnLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 8.0
        volumnLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
    
    }
}

private extension BidVolumnCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct BidVolumnCellPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            BidVolumnCell()
        }
        .frame(width: Constants.OrderPaper.volumnViewWidth, height: 30.0)
    }
}


#endif
