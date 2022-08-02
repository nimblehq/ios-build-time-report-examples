//
//  NilCoalescingCase.swift
//  BuildTimeAnalyzerRecords
//
//  Created by Minh Pham on 02/08/2022.
//

import Foundation
import UIKit

class NilCoalescingCase: UIView {

    // Case: Nil Coalescing Operator
    let topView: UIView? = UIView()
    let bottomView: UIView? = UIView()

    // Cumulative build time: 127.3 ms
    func getSizeByUsingNilCoalescingOnViews() -> CGSize {
        return CGSize(width: bounds.size.width, height: bounds.size.height + (topView?.bounds.size.height ?? 0) + (bottomView?.bounds.size.height ?? 0) + 10)
    }

    // Cumulative build time: 3.9 ms
    func getSizeByUnwrappingNilViews() -> CGSize {
        var verticalPadding: CGFloat = 10
        if let topView = topView {
            verticalPadding += topView.bounds.size.width
        }

        if let bottomView = bottomView {
            verticalPadding += bottomView.bounds.size.width
        }
        return CGSize(width: bounds.size.width, height: bounds.size.height + verticalPadding)
    }
}
