//
//  Eventss.swift
//  luna
//
//  Created by sml on 04/09/23.
//
import Foundation

public class AnalyticsCenter {
    
    public static let shared = AnalyticsCenter()
    
    private init() {}
    
    public func post(_ event: AnalyticsEventType) {
        NotificationCenter.default.post(
            name: .init(rawValue: "kFirebaseEvents"),
            object: nil,
            userInfo: ["event": event]
        )
    }
    
    public func track(_ handler: @escaping (AnalyticsEventType) -> Void) {
        NotificationCenter.default.addObserver(
            forName: .init(rawValue: "kFirebaseEvents"),
            object: nil,
            queue: .main,
            using: {
                guard let event = $0.userInfo?["event"] as? AnalyticsEventType else {
                    return
                }
                
                handler(event)
            }
        )
    }
}
