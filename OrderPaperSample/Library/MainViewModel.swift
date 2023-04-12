//
//  MainViewModel.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/04/12.
//

import Foundation

protocol MainViewModelInput {
    func requestStockInfo(code: String)
}

protocol MainViewModelOutput {
}

protocol MainViewModelType {
    var inputs: MainViewModelInput { get }
    var outputs: MainViewModelOutput { get }
}

class MainViewModel: MainViewModelType, MainViewModelInput, MainViewModelOutput {
    var inputs: MainViewModelInput { self }
    var outputs: MainViewModelOutput { self }
    
    func requestStockInfo(code: String) {
        let stockInfo = StockInfoData.item
        
        
    }
    
    
    
}
