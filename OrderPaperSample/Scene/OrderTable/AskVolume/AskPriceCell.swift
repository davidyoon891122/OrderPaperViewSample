//
//  AskPriceCell.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/30.
//

import UIKit
import SnapKit

final class AskPriceCell: UICollectionViewCell {
    static let identifier = "AskPriceCell"
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        label.text = "8.4300"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var changePercentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .label
        label.text = "-0.24%"
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed.withAlphaComponent(0.3)
        
        [
            priceLabel,
            changePercentLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 8.0
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview().offset(-offset)
        }
        
        changePercentLabel.snp.makeConstraints {
            $0.leading.equalTo(priceLabel.snp.trailing).offset(offset)
            $0.centerY.equalTo(priceLabel)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        changePercentLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AskPriceCell {
    func setupViews() {
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct AskPriceCellPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            AskPriceCell()
        }
        .frame(width: Constants.OrderPaper.priceViewWidth, height: 30.0)
    }
}


#endif
