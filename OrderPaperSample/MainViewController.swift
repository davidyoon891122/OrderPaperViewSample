//
//  MainViewController.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit

final class MainViewController: UIViewController {
    
    
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
        view.backgroundColor = .systemCyan
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
