//
//  InitialViewControllerTests.swift
//  MirrorObjectExampleTests
//
//  Created by Manu on 28/05/2022.
//

import XCTest
@testable import MirrorObjectExample

final class InitialViewControllerTests: XCTestCase {
    private var sut: InitialViewController!
    private var mirror: InitialViewControllerMirror!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InitialViewController") as? InitialViewController
        _ = sut.view
        mirror = InitialViewControllerMirror(reflecting: sut)
    }

    func testLabelInitialValue() {
        // Given
        let expectedValue = "0"

        // Then
        XCTAssertEqual(mirror.valueLabel.text, expectedValue)
    }

    func testButtonBehavior() {
        // Given
        let initialValue = "0"
        let expectedValueAfterTap = "1"
        XCTAssertEqual(mirror.valueLabel.text, initialValue)

        // When
        mirror.incrementButton.sendActions(for: .touchUpInside)

        // Then
        XCTAssertEqual(mirror.valueLabel.text, expectedValueAfterTap)
    }
}

final class InitialViewControllerMirror: MirrorObject {
    // We create a custom init that calls super with the custom object
    init(reflecting vc: InitialViewController) {
        super.init(reflecting: vc)
    }

    // And then we just declare the properties we want to test:
    var valueLabel: UILabel! { extract() }
    var incrementButton: UIButton! { extract() }
}
