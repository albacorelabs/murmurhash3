import XCTest
@testable import murmurhash3

final class MurmurHash3Tests: XCTestCase {

    private func performTest(_ input: String, _ seed: UInt32, _ expected: UInt32) {
        XCTAssertEqual(MurmurHash3.hashString(input, seed), expected)
    }

    func testMurmurHash3() {

        // test vectors from https://stackoverflow.com/questions/14747343/murmurhash3-test-vectors
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

        // additional test vectors from Bitcoin Core
        // https://github.com/bitcoin/bitcoin/blob/master/src/test/hash_tests.cpp#L19
        performTest("", 0x00000000, 0x00000000)
        performTest("", 0xFBA4C795, 0x6a396f08) // 0xFBA4C795 is from BIP37
        performTest("", 0xffffffff, 0x81f16f39)
        performTest("\0", 0x00000000, 0x514e28b7)
        performTest("\0", 0xFBA4C795, 0xea3f0b17)
    }

    static var allTests = [
        ("testMurmurHash3", testMurmurHash3)
    ]
}
