import AVFoundation
import UIKit

final class ExchangeEffectManager {

    static let shared = ExchangeEffectManager()

    private var player: AVAudioPlayer?

    private init() {}

    func playHeartbeatLoop() {
        guard let url = Bundle.main.url(forResource: "heartbeat", withExtension: "mp3") else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1 // 無限ループ
            player?.play()
        } catch {
            print("音声再生エラー")
        }
    }

    func stopHeartbeat() {
        player?.stop()
    }

    func heavyImpact() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }

    func warningImpact() {
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
    }
}

