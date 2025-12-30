import SwiftUI

struct AddCrossView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: CrossListViewModel

    @State private var title = ""
    @State private var owner = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                TextField("十字架（罰内容）", text: $title)
                    .textFieldStyle(.roundedBorder)

                TextField("今、背負っている人", text: $owner)
                    .textFieldStyle(.roundedBorder)

                Button("登録する") {
                    viewModel.addCross(title: title, owner: owner)
                    dismiss()
                }
                .disabled(title.isEmpty || owner.isEmpty)
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
            .navigationTitle("十字架登録")
        }
    }
}

