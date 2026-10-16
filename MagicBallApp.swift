import SwiftUI

@main
struct MagicBallApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    let answers = [
        "Yes!",
        "No way.",
        "Ask again later.",
        "Definitely.",
        "I doubt it.",
        "100% yes.",
        "Not today.",
        "Looks good.",
        "Better not say.",
        "Go for it!"
    ]

    @State private var answer = "Think of a question"
    @State private var spin = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Magic Ball")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [.gray, .black],
                                center: .topLeading,
                                startRadius: 5,
                                endRadius: 250
                            )
                        )
                        .frame(width: 260, height: 260)
                    Text(answer)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(50)
                }
                .rotationEffect(.degrees(spin ? 360 : 0))
                .onTapGesture {
                    ask()
                }

                Text("Tap the ball")
                    .foregroundColor(.gray)
            }
        }
    }

    func ask() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        withAnimation(.easeInOut(duration: 0.6)) {
            spin.toggle()
        }
        answer = answers.randomElement() ?? "Try again"
    }
}
