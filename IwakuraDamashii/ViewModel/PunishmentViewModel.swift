import Foundation
import AVFoundation
import SwiftUI

class PunishmentViewModel: ObservableObject {
    @Published var punishments: [Punishment] = []
    @Published var selectedPunishments: [Punishment] = []
    @Published var exchangeHistories: [ExchangeHistory] = []
    @Published var isExchanging: Bool = false
    @Published var showResult: Bool = false

    // MARK: - 定数
    private let punishmentsKey = "punishments"
    private let historyKey = "exchangeHistories"

    init() {
        loadPunishments()
        loadHistories()
    }

    // MARK: - 十字架データ管理
    func loadPunishments() {
        if let data = UserDefaults.standard.data(forKey: punishmentsKey),
           let decoded = try? JSONDecoder().decode([Punishment].self, from: data) {
            punishments = decoded
        } else {
            // 初期データ
            punishments = [
                Punishment(title: "1週間コメ禁止"),
                Punishment(title: "1ヶ月間 竈門炭治郎のコスプレ")
            ]
            savePunishments()
        }
    }

    func savePunishments() {
        if let data = try? JSONEncoder().encode(punishments) {
            UserDefaults.standard.set(data, forKey: punishmentsKey)
        }
    }

    // MARK: - 履歴管理
    func loadHistories() {
        if let data = UserDefaults.standard.data(forKey: historyKey),
           let decoded = try? JSONDecoder().decode([ExchangeHistory].self, from: data) {
            exchangeHistories = decoded
        }
    }

    func saveHistories() {
        if let data = try? JSONEncoder().encode(exchangeHistories) {
            UserDefaults.standard.set(data, forKey: historyKey)
        }
    }

    // MARK: - 十字架選択
    func toggleSelection(for punishment: Punishment) {
        if let index = punishments.firstIndex(of: punishment) {
            punishments[index].isSelected.toggle()
            savePunishments()
            selectedPunishments = punishments.filter { $0.isSelected }
        }
    }

    // MARK: - 交換処理
    func exchangeSelectedPunishments() {
        guard !selectedPunishments.isEmpty else { return }
        isExchanging = true

        // シャッフル
        var shuffled = selectedPunishments.shuffled()
        // 履歴保存
        let history = ExchangeHistory(exchangedPunishments: shuffled)
        exchangeHistories.insert(history, at: 0)
        saveHistories()

        // 選択解除
        for i in punishments.indices {
            punishments[i].isSelected = false
        }
        selectedPunishments = []
        savePunishments()

        // 演出後にリザルト表示
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.exchangeEffectDuration) {
            self.isExchanging = false
            self.showResult = true
        }
    }

    func closeResult() {
        showResult = false
    }
}
