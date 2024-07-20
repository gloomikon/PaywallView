import SwiftUI

protocol PaywallLayout {

    associatedtype Body: View

    @ViewBuilder func layout(
        header: AnyView,
        content: AnyView,
        footer: AnyView,
        proxy: GeometryProxy
    ) -> Body
}
