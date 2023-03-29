//
//  Extension+UIView.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIView {
    struct UIViewPreview<View: UIView>: UIViewRepresentable {
        let view: View
        
        init(_ builder: @escaping () -> View) {
            view = builder()
        }
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ view: UIView, context: Context) {
            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }
}


#endif
