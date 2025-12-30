import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {

                Spacer()

                Text("岩倉魂")
                    .font(.system(size: 40, weight: .bold))
                    .tracking(2)

                Text("十字架を交換する")
                    .font(.headline)
                    .foregroundColor(.secondary)

                Spacer()

                NavigationLink {
                    CrossListView()
                } label: {
                    Text("交換を始める")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }

            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

