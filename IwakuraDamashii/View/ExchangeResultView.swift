import SwiftUI

struct ExchangeResultView: View {
    @ObservedObject var viewModel: PunishmentViewModel

    var body: some View {
        VStack(spacing: 24) {
            Text("交換成立")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(radius: 10)
            ForEach(viewModel.exchangeHistories.first?.exchangedPunishments ?? []) { punishment in
                Text(punishment.title)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            Button(action: {
                viewModel.closeResult()
            }) {
                Text("閉じる")
                    .font(.headline)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .foregroundColor(.black)
                    .cornerRadius(Constants.buttonCornerRadius)
            }
        }
        .padding()
        .background(Color.black.opacity(0.7))
        .cornerRadius(20)
        .padding()
    }
}
