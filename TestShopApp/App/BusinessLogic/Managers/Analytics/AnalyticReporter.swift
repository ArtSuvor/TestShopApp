//
//  AnalyticReporter.swift
//  TestShopApp
//
//  Created by Art on 07.08.2022.
//

import Foundation
import FirebaseAnalytics

protocol AnalyticReporter {
    func reportEvent(_ event: AnalyticEvents)
}

final class AnalyticReporterImpl: AnalyticReporter {
    func reportEvent(_ event: AnalyticEvents) {
        switch event {
            case .signIn(let string),
                    .signUp(let string):
                Analytics.logEvent(event.description, parameters: ["userName": string])
            case .logOut(let int):
                Analytics.logEvent(event.description, parameters: ["userId": int])
            case .openVC(let string):
                Analytics.logEvent(event.description, parameters: ["screenName": string])
            case .openDetailInfo(let string):
                Analytics.logEvent(event.description, parameters: ["productName": string])
            case .error(let string):
                Analytics.logEvent(event.description, parameters: ["ErrorMessage": string])
        }
    }
}
