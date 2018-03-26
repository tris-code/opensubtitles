import XCTest

extension OpenSubtitlesTests {
    static let __allTests = [
        ("testHash", testHash),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OpenSubtitlesTests.__allTests),
    ]
}
#endif
