import SwiftUI

private enum PaywallLayoutKey: EnvironmentKey {

    static var defaultValue = AnyPaywallLayout(ContentBetweenSafeArea())
}

extension EnvironmentValues {

    var paywallLayout: AnyPaywallLayout {
        get { self[PaywallLayoutKey.self] }
        set { self[PaywallLayoutKey.self] = newValue }
    }
}

extension View {

    func paywallLayout(_ layout: some PaywallLayout) -> some View {
        environment(\.paywallLayout, AnyPaywallLayout(layout))
    }
}
