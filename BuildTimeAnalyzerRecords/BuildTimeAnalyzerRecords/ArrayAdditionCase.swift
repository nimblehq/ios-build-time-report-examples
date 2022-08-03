//
//  ArrayAdditionCase.swift
//  BuildTimeAnalyzerRecords
//
//  Created by Minh Pham on 02/08/2022.
//

import Foundation
import UIKit

class ArrayAdditionCase {

    // Case: Array Addition
    let arrayNameFormat = "Array Name #%d"
    var arrayNames: [String] = []

    // Cumulative build time: 60.9 ms
    func setArrayNamesByAppending() {
        let nameIndexes = [1, 2, 3, 4, 5]
        let count = nameIndexes.count - 1
        var names = nameIndexes.map { String(format: arrayNameFormat, $0) }
        names.append(NSLocalizedString("everything", comment: ""))
        arrayNames = Array(names[0..<count])
        if let lastName = names.last {
            arrayNames.append(lastName)
        }
    }

    // Cumulative build time: 3.1 ms
    func setArrayNamesByConcatenation() {
        let nameIndexes = [1, 2, 3, 4, 5]
        let count = nameIndexes.count - 1
        let names = nameIndexes.map { String(format: arrayNameFormat, $0) } + [NSLocalizedString("everything", comment: "")]
        if let lastName = names.last {
            arrayNames = Array(names[0..<count]) + [lastName]
        }
    }

}
