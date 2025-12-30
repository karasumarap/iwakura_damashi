
import Foundation

struct Cross: Identifiable, Codable {
    let id: UUID
    let title: String
    let owner: String

    init(title: String, owner: String) {
        self.id = UUID()
        self.title = title
        self.owner = owner
    }
}
