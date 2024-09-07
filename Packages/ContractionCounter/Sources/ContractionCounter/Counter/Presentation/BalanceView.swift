import SwiftUI
import DesignSystem

struct BalanceView: View {
  @Binding var balance: Double
  var phasing: Bool = true
  
  var body: some View {
      VStack(alignment: .center) {
        Spacer()
        Rectangle()
          .fill(DSColors.heatMin)
          .frame(height: 4)
          .cornerRadius(3)
          .shadow(radius: 1)
          .rotationEffect(Angle(degrees: balance * 20))
          .hueRotation(Angle(degrees: balance * 115))
        Spacer()
      }
      .padding(.vertical, DSSpacings.Stack.xsmall)
      .phaseAnimator(BalancePhase.allCases) { view, phase in
        if phasing {
          switch phase {
            case .inital:
              view
                .rotationEffect(Angle(degrees: 0.7))
            case .final:
              view
                .rotationEffect(Angle(degrees: -0.7))
          }
        }
      } animation: { phase in
        switch phase {
          case .inital: return .snappy(duration: 0.25)
          case .final: return .snappy(duration: 0.25)
        }
      }
  }
  
  enum BalancePhase: CaseIterable {
    case inital
    case final
  }
}

#Preview {
  var balance: Double = -1
  ZStack {
    DSColors.background
    BalanceView(balance: .init(get: { balance }, set: { _ in }))
  }
}
