// MARK: - PresenterTests

import XCTest

@testable import TinyRouting

final class PresenterTests: XCTestCase {
    
    func testStartRoute() {
        
        let routeDidArriveDestination = expectation(description: "The route arrives the destintation.")
        
        Presenter<Destination> { destination, completion in
            
            XCTAssertEqual(destination, .home)
            
            completion()
                
        }
            .start(
                Route(destination: .home)
                    .onArrive(perform: routeDidArriveDestination.fulfill)
            )
        
        waitForExpectations(timeout: 10.0)
        
    }
    
    static var allTests = [
        ("testStartRoute", testStartRoute)
    ]
    
}
