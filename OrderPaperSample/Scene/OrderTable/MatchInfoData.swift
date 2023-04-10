//
//  MatchInfoData.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/04/07.
//

import Foundation

struct MatchInfoData: Hashable {
    var matchStrength: Double
    var matchData: [MatchData]
}

struct MatchData: Hashable {
    var priceValeu: Double
    var volumQuanti: Int
}


extension MatchInfoData {
    static let item = [
        MatchInfoData(matchStrength: 32.0, matchData: [
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320),
            MatchData(priceValeu: 9.4000, volumQuanti: 320)
        ])
    
    ]
}


