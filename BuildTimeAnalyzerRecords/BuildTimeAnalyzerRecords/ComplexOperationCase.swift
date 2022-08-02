//
//  ComplexOperationCase.swift
//  BuildTimeAnalyzerRecords
//
//  Created by Minh Pham on 29/07/2022.
//

import Foundation
import UIKit

public class ComplexOperationCase {

    // Case: Complex Operation - Example in function parameters
    class IndexedChartViewModel {

        var withXYs: [(Double, Int)] = []
        var updateAt: Date?
        var animated: Bool = true

        func update(withXYs: [(Double, Int)], updatedAt: Date?, animated: Bool) {
            self.withXYs = withXYs
            self.updateAt = updatedAt
            self.animated = animated
        }
    }

    struct LineChartPointHistoryModel {
        let x: CGFloat
        let y: CGFloat
        let data: String
    }

    let indexedChartViewModel = IndexedChartViewModel()


    // Cumulative build time: 79.1 ms
    func updateChartPointsWithNestedCalculation(with values: [LineChartPointHistoryModel], updatedAt: Date?, animated: Bool) {
        indexedChartViewModel.update(
            withXYs: values.enumerated().map { (Double($1.x * 7.0), $0) },
            updatedAt: updatedAt,
            animated: animated
        )
    }

    // Cumulative build time: 8.0 ms
    func updateChartPointsWithSeparatedCalculation(with values: [LineChartPointHistoryModel], updatedAt: Date?, animated: Bool) {
        let xyPoints = values.enumerated().map { (Double($1.x * 7.0), $0) }
        indexedChartViewModel.update(
            withXYs: xyPoints,
            updatedAt: updatedAt,
            animated: animated
        )
    }

    // Case: Complex Operation - Example in handling NSLayoutConstraint
    let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let imageView = UIImageView()

    // Cumulative build time: 41.5 ms
    func setupViewWithNestedCalculation() {
        NSLayoutConstraint
            .activate([
                imageView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0.0),
                imageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 4.0),
                imageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 4.0),
                imageView.heightAnchor.constraint(equalToConstant: floor((parentView.bounds.width - 6.0) * 282.0 / 343.0))
            ])
    }

    // Cumulative build time: 3.5 ms
    func setupViewWithSeparatedCalculation() {
        let ratio: CGFloat = 282.0 / 343.0
        let imageWidth: CGFloat = parentView.bounds.width - 6.0
        let calculatedHeight: CGFloat = floor(imageWidth * ratio)
        NSLayoutConstraint
            .activate([
                imageView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0.0),
                imageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 4.0),
                imageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 4.0),
                imageView.heightAnchor.constraint(equalToConstant: calculatedHeight)
            ])
    }

    // Case: Complex Operation - Example in handling `if` condition
    struct UserActivity {

        enum ActivityType: String {
            case dolfinWalletCoachMark
            case dolfinWalletOnboarding
            case defaultActivity
        }

        var activities: [ActivityType]?
    }

    let userDefault = UserDefaults()
    let activity = UserActivity(activities: [
        .dolfinWalletCoachMark,
        .dolfinWalletOnboarding,
        .defaultActivity,
        .dolfinWalletCoachMark,
        .dolfinWalletOnboarding,
        .defaultActivity,
        .dolfinWalletCoachMark,
        .dolfinWalletOnboarding,
        .defaultActivity
    ])

    private func storeUserActivity(with activity: UserActivity.ActivityType) {
        userDefault.set(activity, forKey: activity.rawValue)
    }

    // Cumulative build time: 13.0 ms
    func removeUserDefaultWithNestedCalculation() {
        let activities = activity.activities ?? []
        activities.forEach { storeUserActivity(with: $0) }
        if !activities.contains(where: { $0 == .dolfinWalletCoachMark }) {
            userDefault.removeObject(forKey: UserActivity.ActivityType.dolfinWalletCoachMark.rawValue)
        }
        if !activities.contains(where: { $0 == .dolfinWalletOnboarding }) {
            userDefault.removeObject(forKey: UserActivity.ActivityType.dolfinWalletOnboarding.rawValue)
        }
    }

    // Cumulative build time: 8.8 ms
    func removeUserDefaultWithSeparatedCalculation() {
        let activities: [UserActivity.ActivityType] = activity.activities ?? []
        var isContainsDolfinWalletCoachMark = false
        var isContainsDolfinWalletOnboarding = false
        for activity in activities {
            storeUserActivity(with: activity)
            if activity == .dolfinWalletCoachMark { isContainsDolfinWalletCoachMark = true }

            if activity == .dolfinWalletOnboarding { isContainsDolfinWalletOnboarding = true }
        }
        if !isContainsDolfinWalletCoachMark { userDefault.removeObject(forKey: UserActivity.ActivityType.dolfinWalletCoachMark.rawValue) }
        if !isContainsDolfinWalletOnboarding { userDefault.removeObject(forKey: UserActivity.ActivityType.dolfinWalletOnboarding.rawValue) }
    }
}
