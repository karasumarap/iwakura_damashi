import Foundation

struct ExchangeHistory: Identifiable, Codable {
    let id: UUID
    let date: Date
    let exchangedPunishments: [Punishment]

    init(id: UUID = UUID(), date: Date = Date(), exchangedPunishments: [Punishment]) {
        self.id = id
        self.date = date
        self.exchangedPunishments = exchangedPunishments
    }
}
