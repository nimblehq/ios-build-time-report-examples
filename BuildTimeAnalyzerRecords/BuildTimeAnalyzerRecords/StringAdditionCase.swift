//
//  StringAdditionCase.swift
//  BuildTimeAnalyzerRecords
//
//  Created by Minh Pham on 29/07/2022.
//

import Foundation
import UIKit

class StringAdditionCase {

    // Case: String Addition
    let path = "path"
    let activeName = "activeName"
    let imageView = UIImageView()

    // Cumulative build time: 44.9 ms
    func setImageNameByConcatenation() {
        imageView.image = UIImage(named: path + "/Normal")
    }

    // Cumulative build time: 4.4 ms
    func setImageNameByInterpolation() {
        imageView.image = UIImage(named: "\(path)/Normal")
    }
}
