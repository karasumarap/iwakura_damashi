import SwiftUI

@main
struct IwakuraDamashiiApp: App {
    @StateObject private var viewModel = PunishmentViewModel()

    var body: some Scene {
        WindowGroup {
            PunishmentListView(viewModel: viewModel)
        }
    }
}
