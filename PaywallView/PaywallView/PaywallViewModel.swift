import Combine

protocol PaywallViewModel: ObservableObject {

    func buy()
    func close()
    func restore()
    func openPrivacyPolicy()
    func openTermsOfUse()
}

class ExamplePaywallViewModel: PaywallViewModel {

    func buy() {
        print("buy")
    }

    func close() {
        print("close")
    }

    func restore() {
        print("restore")
    }

    func openPrivacyPolicy() {
        print("openPrivacyPolicy")
    }

    func openTermsOfUse() {
        print("openTermsOfUse")
    }
}
