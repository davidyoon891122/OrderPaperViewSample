//
//  OrderTableView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class OrderTableView: UIView {
    private lazy var bidVolumnView = BidVolumnView()
    
    private lazy var askPriceView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed.withAlphaComponent(0.3)
        
        return view
    }()
    
    private lazy var rightInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray.withAlphaComponent(0.3)
    
        return view
    }()
    
    private lazy var topHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        
        [
            bidVolumnView,
            askPriceView,
            rightInfoView
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        return stackView
    }()
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .secondarySystemBackground
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        
        
        [
            bidVolumnView,
            askPriceView,
            rightInfoView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        bidVolumnView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(Constants.OrderPaper.volumnViewWidth)
        }
        
        askPriceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(bidVolumnView.snp.trailing)
            $0.width.equalTo(Constants.OrderPaper.priceViewWidth)
        }
        
        rightInfoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(Constants.OrderPaper.volumnViewWidth)
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
}

private extension OrderTableView {
    func setupViews() {
        addSubview(topHStackView)
        
        topHStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(300.0)
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
        .frame(width: UIScreen.main.bounds.width, height: 300.0)
    }
}


#endif