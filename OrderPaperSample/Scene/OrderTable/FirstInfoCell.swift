//
//  FirstInfoCell.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/30.
//

import UIKit
import SnapKit

final class FirstInfoCell: UICollectionViewCell {
    static let identifier = "FirstInfoCell"
    
    private lazy var fiftyTwoWeekHighTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .lightGray
        label.text = "52 Week\nHigh"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var fiftyTwoWeekHighValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .medium)
        label.textColor = .label
        label.text = "19.6837"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var fiftyTwoWeekLowTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .lightGray
        label.text = "52 Week\nLow"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var fiftyTwoWeekLowValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .medium)
        label.textColor = .label
        label.text = "6.0945"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var priceQuotationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .lightGray
        label.text = "Price\nQuotation"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var priceQuotationLowValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .medium)
        label.textColor = .label
        label.text = "0.0100"
        label.textAlignment = .right
        
        return label
    }()
    
    
    private let separatorView = SeparatorView(
        size: 0.5,
        bgColor: .lightGray.withAlphaComponent(0.3),
        direction: .horizontal
    )
    
    private lazy var openTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .lightGray
        label.text = "Open"
        
        return label
    }()
    
    private lazy var openValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .bold)
        label.textColor = .lightGray
        label.text = "8.3900"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var openPercentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .bold)
        label.textColor = .gray
        label.text = "(0.12%)"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var highTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .red
        label.text = "High"
        
        return label
    }()
    
    private lazy var highValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .bold)
        label.textColor = .red
        label.text = "8.4700"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var highPercentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .bold)
        label.textColor = .red
        label.text = "(0.83%)"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var lowTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10.0, weight: .bold)
        label.textColor = .blue
        label.text = "Low"
        
        return label
    }()
    
    private lazy var lowValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .bold)
        label.textColor = .blue
        label.text = "8.3600"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var lowPercentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8.0, weight: .bold)
        label.textColor = .blue
        label.text = "(0.48%)"
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        
        [
            fiftyTwoWeekHighTitleLabel,
            fiftyTwoWeekHighValueLabel,
            fiftyTwoWeekLowTitleLabel,
            fiftyTwoWeekLowValueLabel,
            priceQuotationTitleLabel,
            priceQuotationLowValueLabel,
            separatorView,
            openTitleLabel,
            openValueLabel,
            openPercentLabel,
            highTitleLabel,
            highValueLabel,
            highPercentLabel,
            lowTitleLabel,
            lowValueLabel,
            lowPercentLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 8.0
        fiftyTwoWeekHighTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset).priority(.low)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        fiftyTwoWeekHighTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        fiftyTwoWeekHighValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(fiftyTwoWeekHighTitleLabel)
            $0.leading.equalTo(fiftyTwoWeekHighTitleLabel.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        fiftyTwoWeekLowTitleLabel.snp.makeConstraints {
            $0.top.equalTo(fiftyTwoWeekHighTitleLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        fiftyTwoWeekLowTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        fiftyTwoWeekLowValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(fiftyTwoWeekLowTitleLabel)
            $0.leading.equalTo(fiftyTwoWeekLowTitleLabel.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        priceQuotationTitleLabel.snp.makeConstraints {
            $0.top.equalTo(fiftyTwoWeekLowTitleLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        priceQuotationTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        priceQuotationLowValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(priceQuotationTitleLabel)
            $0.leading.equalTo(priceQuotationTitleLabel.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(priceQuotationTitleLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        openTitleLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        openTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        openValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(openTitleLabel)
            $0.leading.equalTo(openTitleLabel.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        openPercentLabel.snp.makeConstraints {
            $0.top.equalTo(openValueLabel.snp.bottom).offset(offset / 2)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            
        }
        
        highTitleLabel.snp.makeConstraints {
            $0.top.equalTo(openPercentLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        highTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        highValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(highTitleLabel)
            $0.leading.equalTo(highTitleLabel.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        highPercentLabel.snp.makeConstraints {
            $0.top.equalTo(highValueLabel.snp.bottom).offset(offset / 2)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        lowTitleLabel.snp.makeConstraints {
            $0.top.equalTo(highPercentLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        lowTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        lowValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(lowTitleLabel)
            $0.leading.equalTo(lowTitleLabel.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        lowPercentLabel.snp.makeConstraints {
            $0.top.equalTo(lowValueLabel.snp.bottom).offset(offset / 2)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.bottom.equalToSuperview().offset(-offset)
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

private extension FirstInfoCell {
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

struct FirstInfoCellwPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            FirstInfoCell()
        }
        .frame(width: Constants.OrderPaper.volumeViewWidth, height: 300.0)
    }
}


#endif

