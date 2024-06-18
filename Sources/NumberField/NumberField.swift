import SwiftUI

public struct NumberField: View {

    @Binding var text: String
    @State private var formattedText = ""

    private let formatter = NumberFieldFormatter(formatter: .decimalFormatter)

    public var body: some View {
        TextField("Enter decimal number", text: $formattedText)
        .keyboardType(.decimalPad)
        .onChange(of: formattedText) { newValue in
            let filtered = newValue.filter { "0123456789".contains($0) }
            self.formattedText = formatter.format(filtered) ?? filtered
            self.text = filtered
        }
        .onAppear { formattedText = text }
    }
}

#Preview {
    struct NumberFieldPreviewHolder: View {

        @State private var text = "100"

        var body: some View {
            NumberField(text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }

    return NumberFieldPreviewHolder()
}
