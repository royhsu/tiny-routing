// MARK: - AnyRouterTests

import XCTest

@testable import TinyRouting

final class AnyRouterTests: XCTestCase {
    
    func testInitialize() {
        
        _ = AnyRouter<Destination>(Presenter { _, completion in completion() })
        
    }

    static var allTests = [
        ("testInitialize", testInitialize),
    ]
    
}
