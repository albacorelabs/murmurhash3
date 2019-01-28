import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(murmurhash3Tests.allTests)
    ]
}
#endif
