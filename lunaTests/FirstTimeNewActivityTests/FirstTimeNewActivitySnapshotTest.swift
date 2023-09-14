//
//  FirstTimeNewActivitySnapshotTest.swift
//  lunaTests
//
//  Created by Cynara Costa on 13/09/23.
//

import XCTest
import SnapshotTesting
import InlineSnapshotTesting
@testable import luna


class FirstTimeNewActivitySnapshotTest: XCTestCase {
    func testFirstTimeNewActivityViewController() {
        let vc = FirstTimeNewActivityViewController()
        assertSnapshot(of: vc, as: .image)
    }
}
