
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var isDarkMode: Bool = false
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Image(systemName: "arrow.up.circle.fill")
                        Text(String(post.points))
                            .padding(.trailing, 15)
                        Text(post.title)
                            .padding(.trailing, 10)
                    }
                }
            }
            .navigationBarItems(leading: HStack {
                Text("H4X0R News")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }, trailing: Button(action: toggleDarkMode) {
                Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    .font(.body)
                    .foregroundColor(isDarkMode ? .yellow : .blue)
            })
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .onAppear {
                self.networkManager.fetchData()
            }
        }
    }
    
    private func toggleDarkMode() {
        isDarkMode.toggle()
    }
}
