//  PooTools_Example
//
//  Created by 邓杰豪 on 10/13/24.
//  Copyright © 2024 crazypoo. All rights reserved.
//

import UIKit

extension DefaultElementAttributesLibrary {
    final class ApplicationAttributesSectionDataSource: InspectorElementSectionDataSource {
        var state: InspectorElementSectionState = .collapsed

        let title = "Application"
        private let application: UIApplication

        init?(with object: NSObject) {
            guard let application = object as? UIApplication else { return nil }
            self.application = application
        }

        private enum Property: String, Swift.CaseIterable {
            case alternateIconName = "Alternate Icon Name"
            case applicationIconBadgeNumber = "Icon Badge Number"
            case applicationState = "State"
            case applicationSupportsShakeToEdit = "Shake To Edit"
            case backgroundRefreshStatus
            case backgroundTimeRemaining
            case isIdleTimerEnabled = "Idle Timer"
            case isProtectedDataAvailable
            case isRegisteredForRemoteNotifications = "Remote Notifications"
            case supportsAlternateIcons = "Alternate Icons"
            case supportsMultipleScenes = "Multiple Scenes"
            case userInterfaceLayoutDirection
        }

        var properties: [InspectorElementProperty] {
            Property.allCases.compactMap { property in
                switch property {
                case .isIdleTimerEnabled:
                    return .switch(
                        title: property.rawValue,
                        isOn: { !self.application.isIdleTimerDisabled },
                        handler: { self.application.isIdleTimerDisabled = !$0 }
                    )
                case .applicationIconBadgeNumber:
                    return .integerStepper(
                        title: property.rawValue,
                        value: { self.application.applicationIconBadgeNumber },
                        range: { 0...1000 },
                        stepValue: { 1 },
                        handler: { self.application.applicationIconBadgeNumber = $0 }
                    )
                case .applicationSupportsShakeToEdit:
                    return .switch(
                        title: property.rawValue,
                        isOn: { self.application.applicationSupportsShakeToEdit },
                        handler: { self.application.applicationSupportsShakeToEdit = $0 }
                    )
                case .applicationState:
                    return .textField(
                        title: property.rawValue,
                        placeholder: .none,
                        axis: .horizontal,
                        value: {
                            switch self.application.applicationState {
                            case .active: return "Active"
                            case .inactive: return "Inactive"
                            case .background: return "Background"
                            @unknown default: return "Unknown"
                            }
                        }
                    )
                case .backgroundTimeRemaining:
                    return .none
                case .backgroundRefreshStatus:
                    return .none
                case .isProtectedDataAvailable:
                    return .none
                case .userInterfaceLayoutDirection:
                    return .none
                case .supportsMultipleScenes:
                    return .switch(
                        title: property.rawValue,
                        isOn: { self.application.supportsMultipleScenes }
                    )
                case .isRegisteredForRemoteNotifications:
                    return .switch(
                        title: property.rawValue,
                        isOn: { self.application.isRegisteredForRemoteNotifications }
                    )
                case .supportsAlternateIcons:
                    return .switch(
                        title: property.rawValue,
                        isOn: { self.application.supportsAlternateIcons }
                    )
                case .alternateIconName:
                    return .textField(
                        title: property.rawValue,
                        placeholder: .none,
                        value: { self.application.alternateIconName }
                    )
                }
            }
        }
    }
}
