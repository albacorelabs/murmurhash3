import XCTest
@testable import murmurhash3

final class murmurhash3Tests: XCTestCase {

    private func performTest(_ input: String, _ seed: UInt32, _ expected: UInt32) {
        XCTAssertEqual(MurmurHash3.hashString(input, seed), expected)
    }

    func testMurmurHash3() {
        performTest("", 0, 0)
        performTest("", 1, 0x514E28B7)

    }

    static var allTests = [
        ("testMurmurHash3", testMurmurHash3),
    ]
}
