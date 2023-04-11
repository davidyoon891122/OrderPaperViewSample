//
//  OrderTableView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class OrderTableView: UIView {
    private lazy var bidVolumeView = BidVolumeView()
    
    private lazy var askPriceView = AskPriceView()
    
    private lazy var rightInfoView = RightInfoView()
    
    private lazy var topHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        
        bidVolumeView.snp.makeConstraints {
            $0.width.equalTo(Constants.OrderPaper.volumeViewWidth)
        }
        
        askPriceView.snp.makeConstraints {
            $0.width.equalTo(Constants.OrderPaper.priceViewWidth)
        }
        
        rightInfoView.snp.makeConstraints {
            $0.width.equalTo(Constants.OrderPaper.volumeViewWidth)
        }
        
        [
            bidVolumeView,
            askPriceView,
            rightInfoView
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        return stackView
    }()
    
    private lazy var matchStrengthView = MatchStrengthView()
    
    private lazy var bidPriceView = BidPriceView()
    
    private lazy var askVolumnView = UIView()
    
    private lazy var bottomHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        
        matchStrengthView.backgroundColor = .red
        matchStrengthView.snp.makeConstraints {
            $0.width.equalTo(Constants.OrderPaper.volumeViewWidth)
        }
        
        bidPriceView.backgroundColor = .orange
        bidPriceView.snp.makeConstraints {
            $0.width.equalTo(Constants.OrderPaper.priceViewWidth)
        }
        
        askVolumnView.backgroundColor = .yellow
        askVolumnView.snp.makeConstraints {
            $0.width.equalTo(Constants.OrderPaper.volumeViewWidth)
        }
        
        [
            matchStrengthView,
            bidPriceView,
            askVolumnView
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension OrderTableView {
    func setupViews() {
        [
            topHStackView,
            bottomHStackView
        ]
            .forEach {
                addSubview($0)
            }
        
        topHStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300.0)
        }
        
        bottomHStackView.snp.makeConstraints {
            $0.top.equalTo(topHStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300.0)
            $0.bottom.equalToSuperview()
        }
    }
}




#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct OrderTableViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            OrderTableView()
        }
        .frame(width: UIScreen.main.bounds.width, height: 600.0)
    }
}


#endif
