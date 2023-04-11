//
//  MatchInfoData.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/04/07.
//

import Foundation

struct MatchInfoStrengthData: Hashable {
    var matchStrength: Double
}

struct MatchData: Hashable {
    var priceValeu: Double
    var volumQuanti: Int
}


extension MatchInfoStrengthData {
    static let strengthItem = MatchInfoStrengthData(matchStrength: 130.50)
}

extension MatchData {
    static let matchItem = [
            MatchData(priceValeu: 9.4500, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.3500, volumQuanti: 320),
            MatchData(priceValeu: 9.3000, volumQuanti: 320),
            MatchData(priceValeu: 9.2500, volumQuanti: 320),
            MatchData(priceValeu: 9.2000, volumQuanti: 320),
            MatchData(priceValeu: 9.1500, volumQuanti: 320),
            MatchData(priceValeu: 9.1000, volumQuanti: 320),
            MatchData(priceValeu: 9.0500, volumQuanti: 320),
            MatchData(priceValeu: 9.0000, volumQuanti: 320),
            MatchData(priceValeu: 8.9500, volumQuanti: 320),
            MatchData(priceValeu: 8.9000, volumQuanti: 320),
            MatchData(priceValeu: 8.8500, volumQuanti: 320),
            MatchData(priceValeu: 8.8000, volumQuanti: 320),
            MatchData(priceValeu: 8.7500, volumQuanti: 320)
    ]
}


