//
//  RoundUsageCase.swift
//  BuildTimeAnalyzerRecords
//
//  Created by Minh Pham on 02/08/2022.
//

import Foundation

class RoundUsageCase {

    // Case: Round() usage
    let tValue: Double = 2.0
    let wValue: Double = 5.0
    let xValue: Double = 10.0
    let yValue: Double = 20.0
    let zValue: Double = 30.0

    // Cumulative build time: 41.9 ms
    func setFinalValueWithRoundUsage() {
        let finalValue = tValue - wValue - xValue + round(yValue * 0.66) + zValue
    }

    // Cumulative build time: 2.6 ms
    func setFinalValueWithoutRoundUsage() {
        let finalValue = tValue - wValue - xValue + (yValue * 0.66) + zValue
    }
}
