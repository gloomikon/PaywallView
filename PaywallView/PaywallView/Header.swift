import SwiftUI

private enum HeaderForegroundColorKey: EnvironmentKey {
    static var defaultValue = Color(.label)
}

extension EnvironmentValues {

    var headerForegroundColor: Color {
        get { self[HeaderForegroundColorKey.self] }
        set { self[HeaderForegroundColorKey.self] = newValue }
    }
}

extension View {

    func headerForegroundColor(_ color: Color) -> some View {
        environment(\.headerForegroundColor, color)
    }
}

struct Header<ViewModel: PaywallViewModel>: View {

    @EnvironmentObject private var viewModel: ViewModel
    @Environment(\.headerForegroundColor) private var foregroundColor

    var body: some View {
        HStack {
            Button {
                viewModel.close()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
            }

            Spacer()

            Button("Restore") {
                viewModel.restore()
            }
        }
        .foregroundStyle(foregroundColor)
        .padding(.horizontal, 18)
        .padding(.top, 2)
        .font(.footnote)
    }
}
