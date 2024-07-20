import SwiftUI

struct AnyPaywallLayout: PaywallLayout {

    private let layout: (AnyView, AnyView, AnyView, GeometryProxy) -> AnyView

    init<Layout: PaywallLayout>(_ layout: Layout) {
        self.layout = { header, content, footer, proxy in
            AnyView(layout.layout(
                header: header,
                content: content,
                footer: footer,
                proxy: proxy
            ))
        }
    }

    @ViewBuilder func layout(
        header: AnyView,
        content: AnyView,
        footer: AnyView,
        proxy: GeometryProxy
    ) -> AnyView {
        layout(header, content, footer, proxy)
    }
}
