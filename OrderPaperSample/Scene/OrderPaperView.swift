//
//  OrderPaperView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class OrderPaperView: UIView {
    private lazy var topInfoView = TopInfoView(viewModel: viewModel)
    
    private lazy var orderTableView = OrderTableView(viewModel: viewModel)
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        [
            topInfoView,
            orderTableView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        topInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().priority(.low)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        orderTableView.snp.makeConstraints {
            $0.top.equalTo(topInfoView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().priority(.low)
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    private var viewModel: MainViewModelType
    
    init(viewModel: MainViewModelType) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStockInfoData(stockInfo: StockInfoData) {
        topInfoView.setInfoData(stockInfo: stockInfo)
        orderTableView.setInfoData(stockInfo: stockInfo)
    }
}

extension OrderPaperView {
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

struct OrderPaperViewPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            OrderPaperView(viewModel: MainViewModel())
        }
    }
}


#endif
