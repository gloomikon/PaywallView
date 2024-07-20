import SwiftUI

struct PaywallView<ViewModel: PaywallViewModel, Content: View, HeaderView: View, FooterView: View>: View {

    @Environment(\.paywallLayout) private var layout
    @ObservedObject private var viewModel: ViewModel
    private let content: Content
    private let header: HeaderView
    private let footer: FooterView

    init(
        viewModel: ViewModel,
        @ViewBuilder content: () -> Content,
        @ViewBuilder header: () -> HeaderView,
        @ViewBuilder footer: () -> FooterView
    ) {
        self.viewModel = viewModel
        self.content = content()
        self.header = header()
        self.footer = footer()
    }

    private var headerView: some View {
        header
            .environmentObject(viewModel)
    }

    private var footerView: some View {
        footer
            .environmentObject(viewModel)
    }

    private var buyButton: some View {
        Button {
            viewModel.buy()
        } label: {
            Text("Continue")
                .padding()
                .frame(maxWidth: .infinity)
        }
        .foregroundStyle(.white)
        .font(.title3)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 12))
        .padding(.bottom, 52)
        .padding(.horizontal, 18)
    }

    var body: some View {
        GeometryReader { proxy in
            AnyView(layout.layout(
                header: AnyView(headerView),
                content: AnyView(content),
                footer: AnyView(buyButton
                    .overlay(alignment: .bottom) {
                        footerView
                    }),
                proxy: proxy
            ))
            .ignoresSafeArea(edges: .vertical)
        }
    }
}

extension PaywallView where HeaderView == Header<ViewModel>, FooterView == Footer<ViewModel> {

    init(
        viewModel: ViewModel,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            viewModel: viewModel,
            content: content
        ) {
            Header<ViewModel>()
        } footer: {
            Footer<ViewModel>()
        }
    }
}
