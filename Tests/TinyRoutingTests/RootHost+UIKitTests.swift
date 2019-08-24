#if canImport(UIKit)

// MARK: - RootHost

import UIKit
import XCTest

@testable import TinyRouting

final class RootHost_UIKitTests: XCTestCase {
    
    func testStartRoute() {
        
        let routeDidArriveDestination = expectation(description: "The route arrives the destintation.")
        
        let window = UIWindow()
        
        window.rootViewController = UIViewController()
        
        let destinationViewController = UIViewController()
        
        RootHost(window: window)
            .start(
                Route(destination: destinationViewController)
                    .onArrive {
                    
                        defer { routeDidArriveDestination.fulfill() }
                        
                        XCTAssert(window.rootViewController === destinationViewController)
                        
                    }
            )
        
        waitForExpectations(timeout: 10.0)
        
    }
    
    static var allTests = [
        ("testStartRoute", testStartRoute),
    ]
    
}

#endif
