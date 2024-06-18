import Foundation

final class NumberFieldFormatter {

    var formatter: NumberFormatter

    init(formatter: NumberFormatter = .numberFormatter) {
        self.formatter = formatter
    }

    func format(_ input: String) -> String? {
        if let number = formatter.number(from: input) {
            return formatter.string(from: number)
        } else if let number = Double(input) {
            return formatter.string(from: NSNumber(value: number))
        }
        return nil
    }

    func format(_ input: String, locale: Locale = .current) -> String? {
        formatter.locale = locale
        if let number = formatter.number(from: input) {
            return formatter.string(from: number)
        } else if let number = Double(input) {
            return formatter.string(from: NSNumber(value: number))
        }
        return nil
    }
}

extension NumberFormatter {
    static var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.groupingSeparator = " "
        return formatter
    }

    static var decimalFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = " "
        return formatter
    }
}
