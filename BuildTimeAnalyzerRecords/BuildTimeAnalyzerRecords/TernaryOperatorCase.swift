//
//  TernaryOperatorCase.swift
//  BuildTimeAnalyzerRecords
//
//  Created by Minh Pham on 02/08/2022.
//

import Foundation

class TernaryOperatorCase {

    // Case: Ternary Operator
    var systemType0StringFormat = "System Type 0%d"
    var systemType1StringFormat = "System Type 1%d"
    var systemNames: [String] = []

    // Cumulative build time: 27.8 ms
    func setSystemNamesByUsingTernaryOperator(systemType: Int) {
        systemNames = systemType == 0 ? (1...9).map { String(format: systemType0StringFormat, $0) } : (2...9).map { String(format: systemType1StringFormat, $0) }
    }

    // Cumulative build time: 2.7 ms
    func setSystemNamesByUsingIfElse(systemType: Int) {
        if systemType == 0 {
            systemNames = (1...9).map { String(format: systemType0StringFormat, $0) }
        } else {
            systemNames = (2...9).map { String(format: systemType1StringFormat, $0) }
        }
    }
}
