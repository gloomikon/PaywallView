import SwiftUI

struct ContentBetweenSafeArea: PaywallLayout {

    @ViewBuilder func layout(
        header: AnyView,
        content: AnyView,
        footer: AnyView,
        proxy: GeometryProxy
    ) -> some View {
        VStack(spacing: 0) {
            header
            Rectangle().fill(.clear)
                .overlay {
                    content
                }
                .clipped()
            footer
        }
        .padding(.top, proxy.safeAreaInsets.top)
        .padding(.bottom, proxy.safeAreaInsets.bottom)
    }
}

extension PaywallLayout where Self == ContentBetweenSafeArea {

    static var contentBetweenSafeArea: ContentBetweenSafeArea {
        ContentBetweenSafeArea()
    }
}
