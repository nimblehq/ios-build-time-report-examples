//
//  CGFloatCastingCase.swift
//  BuildTimeAnalyzerRecords
//
//  Created by Minh Pham on 02/08/2022.
//

import Foundation
import UIKit

class CGFloatCastingCase: UIView {

    // Case: CGFloat Casting
    let hour: CGFloat = 24.0
    let hourDelta: CGFloat = 12.0
    let minute: CGFloat = 60.0
    let minuteDelta: CGFloat = 30.0
    let unit: CGFloat = 10


    // Cumulative build time: 107.6 ms
    func getCGFloatValueWithRedundantCasting() -> CGFloat {
        return CGFloat(Double.pi) * (CGFloat((hour + hourDelta + CGFloat(minute + minuteDelta) / 60) * 5) - 15) * unit / 180
    }

    // Cumulative build time: 19.1 ms
    func getCGFloatValueWithoutRedundantCasting() -> CGFloat {
        return CGFloat(Double.pi) * ((hour + hourDelta + (minute + minuteDelta) / 60) * 5 - 15) * unit / 180
    }
}
