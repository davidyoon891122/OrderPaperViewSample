//
//  FirstInfoData.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/30.
//

import Foundation

struct FirstInfoData: Hashable {
    var fiftyTwoWeekHigh: Double
    var fiftyTwoWeekLow: Double
    var priceQuotation: Double
    var open: Double
    var high: Double
    var low: Double
}

extension FirstInfoData {
    static let item =
        FirstInfoData(
            fiftyTwoWeekHigh: 8.4600,
            fiftyTwoWeekLow: 6.0945,
            priceQuotation: 0.0100,
            open: 8.3900,
            high: 8.4600,
            low: 8.3600
        )
    
}
