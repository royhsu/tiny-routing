import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AnyRouterTests.allTests),
        testCase(PresenterTests.allTests),
        testCase(RootHost_UIKitTests.allTests),
    ]
}
#endif
