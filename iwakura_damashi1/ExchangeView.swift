import SwiftUI

struct ExchangeView: View {

    let cross: Cross

    @State private var phase: Phase = .ready

    enum Phase {
        case ready
        case suspense
        case result
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                Text(titleText)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .opacity(phase == .result ? 1 : 0.7)

                Spacer()

                if phase == .ready {
                    Button("交換する") {
                        startSuspense()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
            .padding()
        }
    }

    var titleText: String {
        switch phase {
        case .ready:
            return cross.title
        case .suspense:
            return "……"
        case .result:
            return "交換成立"
        }
    }

    func startSuspense() {
        phase = .suspense

        ExchangeEffectManager.shared.heavyImpact()
        ExchangeEffectManager.shared.playHeartbeatLoop()

        // 焦らし時間（ここが超重要）
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            revealResult()
        }
    }

    func revealResult() {
        ExchangeEffectManager.shared.stopHeartbeat()
        ExchangeEffectManager.shared.warningImpact()

        withAnimation(.easeOut(duration: 0.6)) {
            phase = .result
        }
    }
}

