//
//  EventType.swift
//  luna
//
//  Created by sml on 04/09/23.
//

import Foundation

public protocol AnalyticsEventType {
  var eventName: String { get }
  var userInfo: [AnyHashable: Any?] { get }
}
