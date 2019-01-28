import XCTest

import murmurhash3Tests

var tests = [XCTestCaseEntry]()
tests += murmurhash3Tests.allTests()
XCTMain(tests)