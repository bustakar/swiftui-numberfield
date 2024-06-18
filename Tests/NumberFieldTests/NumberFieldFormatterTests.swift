import XCTest
@testable import NumberField

final class NumberFieldFormatterTests: XCTestCase {

    private let formatter = NumberFieldFormatter()

    func test_NumberFieldFormatter_FormatNumbers_ShouldSucceed() throws {
        for example in numberExamples {
            let formatted = formatter.format(example.raw)
            XCTAssertEqual(formatted, example.formatted)
        }
    }

    func test_NumberFieldFormatter_FormatDecimals_ShouldSucceed() throws {
        formatter.formatter = .decimalFormatter
        for example in decimalExamples {
            let formatted = formatter.format(example.raw, locale: Locale(identifier: "cs_CZ"))
            XCTAssertEqual(formatted, example.formatted)
        }
    }
}

extension NumberFieldFormatterTests {
    private var numberExamples: [(raw: String, formatted: String)] {
        [
            ("100", "100"),
            ("1000", "1 000"),
            ("10000", "10 000"),
            ("100000", "100 000"),
            ("1000000", "1 000 000"),
            ("100000", "100 000"),
            ("10000", "10 000"),
            ("1000", "1 000"),
            ("100", "100"),
            ("10", "10"),
            ("1", "1")
        ]
    }

    private var decimalExamples: [(raw: String, formatted: String)] {
        [
            ("100", "100"),
            ("1000", "1 000"),
            ("1000.", "1 000,"),
            ("1000.0", "1 000,0"),
            ("1000.01", "1 000,01"),
            ("1000.0", "1 000,0"),
            ("1000.", "1 000,"),
            ("1000", "1 000"),
            ("100", "100"),
            ("10", "10"),
            ("10.", "10,"),
            ("10.1", "10,1")
        ]
    }
}
