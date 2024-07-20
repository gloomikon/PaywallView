import SwiftUI

@main
struct PaywallViewApp: App {
    var body: some Scene {
        WindowGroup {
            PaywallView(viewModel: ExamplePaywallViewModel()) {
                Rectangle()
                    .fill(.yellow)
                    .frame(height: 1000)
            }
            .paywallLayout(.ignoringTopEdge)
            .headerForegroundColor(.red)
            .background(.gray.opacity(0.4))
        }
    }
}
