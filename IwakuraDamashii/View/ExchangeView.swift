import SwiftUI
import AVFoundation

struct ExchangeView: View {
    @ObservedObject var viewModel: PunishmentViewModel
    @State private var isDark = false
    @State private var showVideo = false
    @State private var player: AVAudioPlayer?

    var body: some View {
        ZStack {
            Color.black.opacity(isDark ? 1 : 0)
                .ignoresSafeArea()
                .animation(.easeIn(duration: 0.3), value: isDark)

            if showVideo {
                VideoPlayerView(videoName: Constants.exchangeVideoFile)
            }

            if viewModel.showResult {
                ExchangeResultView(viewModel: viewModel)
            }
        }
        .onAppear {
            performExchangeEffect()
        }
    }

    private func performExchangeEffect() {
        // 画面暗転
        isDark = true
        // バイブ
        let generator = UIImpactFeedbackGenerator(style: Constants.vibrationStrength)
        generator.impactOccurred()
        // 効果音
        playSound()
        // 動画
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showVideo = true
        }
    }

    private func playSound() {
        guard let url = Bundle.main.url(forResource: Constants.exchangeSoundFile, withExtension: nil) else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            // TODO: エラー処理
        }
    }
}
