import SwiftUI

struct PunishmentListView: View {
    @ObservedObject var viewModel: PunishmentViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.punishments) { punishment in
                        HStack {
                            Text(punishment.title)
                                .font(.body)
                            Spacer()
                            if punishment.isSelected {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.toggleSelection(for: punishment)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())

                Button(action: {
                    viewModel.exchangeSelectedPunishments()
                }) {
                    Text("交換する")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.selectedPunishments.isEmpty ? Color.gray : Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding()
                .disabled(viewModel.selectedPunishments.isEmpty)
            }
            .navigationTitle("十字架リスト")
        }
    }
}
