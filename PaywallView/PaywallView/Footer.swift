import SwiftUI

struct Footer<ViewModel: PaywallViewModel>: View {

    @EnvironmentObject private var viewModel: ViewModel

    var body: some View {
        HStack {
            Button("Privacy Policy") {
                viewModel.openPrivacyPolicy()
            }

            Spacer()

            Button("Terms of Use") {
                viewModel.openTermsOfUse()
            }
        }
        .foregroundStyle(Color(.label))
        .padding(.horizontal, 18)
        .padding(.top, 2)
        .font(.footnote)
    }
}
