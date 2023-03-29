//
//  VolumnData.swift
//  OrderPaperSample
//
//  Created by jiwon Yoon on 2023/03/29.
//

import Foundation

class VolumnData: Hashable {
    var id = UUID()
    var volumn: Int = 0
    
    init(volumn: Int) {
        self.volumn = volumn
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: VolumnData, rhs: VolumnData) -> Bool {
        lhs.id == rhs.id
    }
}

extension VolumnData {
    static let allItem = [
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210),
        VolumnData(volumn: 3210)
    ]
}
