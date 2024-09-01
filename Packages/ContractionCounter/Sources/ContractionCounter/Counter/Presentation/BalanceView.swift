import SwiftUI
import DesignSystem

struct BalanceView: View {
  @Binding var balance: Double
  
  var body: some View {
    VStack(alignment: .center) {
      Spacer()
      Rectangle()
        .fill(DSColors.heatMin)
        .frame(height: 3)
        .cornerRadius(3)
        .shadow(radius: 3)
        .rotationEffect(Angle(degrees: balance * 20))
        .hueRotation(Angle(degrees: balance * 115))
        .animation(.bouncy(duration: 0.7), value: balance)
      Spacer()
    }
    .padding()
    .phaseAnimator(BalancePhase.allCases) { view, phase in
      switch phase {
        case .inital:
          view
            .rotationEffect(Angle(degrees: 0.3))
        case .final:
          view
            .rotationEffect(Angle(degrees: -0.3))
      }
    } animation: { phase in
      switch phase {
        case .inital: return .spring(duration: 0.1)
        case .final: return .spring(duration: 0.1)
      }
    }
  }
  
  enum BalancePhase: CaseIterable {
    case inital
    case final
  }
}

#Preview {
  var balance: Double = -0.4
  ZStack {
    DSColors.background
    BalanceView(balance: .init(get: { balance }, set: { _ in }))
  }
}
