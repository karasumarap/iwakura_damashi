import Foundation

struct Punishment: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var isSelected: Bool = false

    init(id: UUID = UUID(), title: String, isSelected: Bool = false) {
        self.id = id
        self.title = title
        self.isSelected = isSelected
    }
}
