import SwiftUI

struct CrossListView: View {

    @StateObject private var viewModel = CrossListViewModel()
    @State private var showAdd = false

    var body: some View {
        List {
            ForEach(viewModel.crosses) { cross in
                NavigationLink {
                    ExchangeView(cross: cross)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(cross.title)
                            .font(.headline)

                        Text("背負い中：\(cross.owner)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("十字架一覧")
        .toolbar {
            Button {
                showAdd = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showAdd) {
            AddCrossView(viewModel: viewModel)
        }
    }
}

