//
//  TopInfoView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class TopInfoView: UIView {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .label
        label.text = "Apple"
        
        return label
    }()
    
    private lazy var currentPricelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .medium)
        label.textColor = .red
        label.text = "$160.9800"
        
        return label
    }()
    
    private lazy var wonPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .light)
        label.textColor = .gray
        label.text = "198,200원"
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var marketLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .light)
        label.textColor = .gray
        label.text = "데이마켓"
        
        return label
    }()
    
    private lazy var valueChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.textColor = .red
        label.text = "+3.4500%"
        
        return label
    }()
    
    private lazy var percentChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.textColor = .red
        label.text = "(2.35%)"
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        [
            nameLabel,
            currentPricelabel,
            wonPriceLabel,
            marketLabel,
            valueChangeLabel,
            percentChangeLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 8.0
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
//            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        currentPricelabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(offset)
            $0.leading.equalTo(nameLabel)
        }
        
        currentPricelabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        wonPriceLabel.snp.makeConstraints {
            $0.centerY.equalTo(currentPricelabel)
            $0.leading.equalTo(currentPricelabel.snp.trailing).offset(offset)
//            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        marketLabel.snp.makeConstraints {
            $0.top.equalTo(currentPricelabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        marketLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        valueChangeLabel.snp.makeConstraints {
            $0.centerY.equalTo(marketLabel)
            $0.leading.equalTo(marketLabel.snp.trailing).offset(offset)
            $0.bottom.equalToSuperview().offset(-offset)
        }
        
        valueChangeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        percentChangeLabel.snp.makeConstraints {
            $0.centerY.equalTo(valueChangeLabel)
            $0.leading.equalTo(valueChangeLabel.snp.trailing).offset(offset)
//            $0.trailing.equalToSuperview().offset(-offset)
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

private extension TopInfoView {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct TopInfoViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            TopInfoView()
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 100.0)
    }
}


#endif

