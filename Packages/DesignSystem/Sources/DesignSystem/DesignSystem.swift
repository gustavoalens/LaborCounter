import SwiftUI

public final class DesignSystem {
  nonisolated(unsafe) static var theme: Theme = DefaultTheme()
  public static func start(theme: Theme) {
    Self.theme = theme
  }
}
