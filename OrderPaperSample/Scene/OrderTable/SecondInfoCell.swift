//
//  SecondInfoCell.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/30.
//

import UIKit
import SnapKit

final class SecondInfoCell: UICollectionViewCell {
    static let identifier = "SecondInfoCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct SecondInfoCellPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            SecondInfoCell()
        }
        .frame(width: Constants.OrderPaper.volumeViewWidth, height: 300.0)
    }
}


#endif
