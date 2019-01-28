import XCTest
@testable import murmurhash3

final class MurmurHash3Tests: XCTestCase {

    private func performTest(_ input: String, _ seed: UInt32, _ expected: UInt32) {
        XCTAssertEqual(MurmurHash3.hashString(input, seed), expected)
    }

    // test vectors from https://stackoverflow.com/questions/14747343/murmurhash3-test-vectors
    func testMurmurHash3() {
        performTest("", 0, 0)
        performTest("", 1, 0x514E28B7)
        performTest("", 0xffffffff, 0x81F16F39)
        performTest("\0\0\0\0", 0, 0x2362F9DE)

        performTest("aaaa", 0x9747b28c, 0x5A97808A)
        performTest("aaa", 0x9747b28c, 0x283E0130)
        performTest("aa", 0x9747b28c, 0x5D211726)
        performTest("a", 0x9747b28c, 0x7FA09EA6)

        performTest("abcd", 0x9747b28c, 0xF0478627)
        performTest("abc", 0x9747b28c, 0xC84A62DD)
        performTest("ab", 0x9747b28c, 0x74875592)
        performTest("a", 0x9747b28c, 0x7FA09EA6)

        performTest("Hello, world!", 0x9747b28c, 0x24884CBA)

        performTest("ππππππππ", 0x9747b28c, 0xD58063C1)

        let aaaaString = String(repeating: "a", count: 256)
        performTest(aaaaString, 0x9747b28c, 0x37405BDC)

        performTest("abc", 0, 0xB3DD93FA)

        performTest("The quick brown fox jumps over the lazy dog", 0x9747B28C, 0x2FA826CD)
    }

    static var allTests = [
        ("testMurmurHash3", testMurmurHash3)
    ]
}
