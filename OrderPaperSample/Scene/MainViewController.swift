//
//  MainViewController.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit
import RxSwift

final class MainViewController: UIViewController {
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let hogaView = UIView()
    
    private lazy var orderPaperView = OrderPaperView(viewModel: viewModel)
    
    private lazy var scrollTestView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        orderPaperView.backgroundColor = .systemBackground
        
        [
            orderPaperView,
            scrollTestView
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        
        scrollTestView.snp.makeConstraints {
            $0.height.equalTo(700)
        }
        
        return stackView
    }()
    
    private var viewModel: MainViewModelType = MainViewModel()
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupViews()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.inputs.requestStockInfo(code: "Apple")
    }
}

private extension MainViewController {
    func configureNavigation() {
        navigationItem.title = "MainOrderPaper"
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func bindViewModel() {
        viewModel.outputs.stockInfoPublishSubject
            .subscribe(onNext: { [weak self] stockInfo in
                guard let self = self else { return }
                self.orderPaperView.setStockInfoData(stockInfo: stockInfo)
            })
            .disposed(by: disposeBag)
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MainViewController_Preview: PreviewProvider {
    static var previews: some View {
        MainViewController()
            .showPreview()
    }
}

#endif
