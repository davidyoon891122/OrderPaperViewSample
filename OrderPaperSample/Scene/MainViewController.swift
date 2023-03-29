//
//  MainViewController.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let hogaView = UIView()
    
    private let orderPaperView = OrderPaperView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        orderPaperView.backgroundColor = .red
        
        [
            orderPaperView
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupViews()
    }
}

extension MainViewController {
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
