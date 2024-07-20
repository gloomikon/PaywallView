import SwiftUI

struct ContentIgnoringTopEdge: PaywallLayout {

    @ViewBuilder func layout(
        header: AnyView,
        content: AnyView,
        footer: AnyView,
        proxy: GeometryProxy
    ) -> some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.clear)
                .overlay { content }
                .clipped()
                .overlay(alignment: .top) {
                    header.padding(.top, proxy.safeAreaInsets.top)
                }

            footer
        }
        .padding(.bottom, proxy.safeAreaInsets.bottom)
    }
}

extension PaywallLayout where Self == ContentIgnoringTopEdge {

    static var ignoringTopEdge: ContentIgnoringTopEdge {
        ContentIgnoringTopEdge()
    }
}
