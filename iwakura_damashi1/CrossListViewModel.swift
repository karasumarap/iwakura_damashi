import Foundation
import Foundation
import Combine

final class CrossListViewModel: ObservableObject {

    @Published var crosses: [Cross] = []

    private let saveKey = "saved_crosses"

    init() {
        load()
    }

    func addCross(title: String, owner: String) {
        let cross = Cross(title: title, owner: owner)
        crosses.append(cross)
        save()
    }

    func save() {
        if let data = try? JSONEncoder().encode(crosses) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

    func load() {
        guard
            let data = UserDefaults.standard.data(forKey: saveKey),
            let decoded = try? JSONDecoder().decode([Cross].self, from: data)
        else {
            return
        }
        crosses = decoded
    }
}

