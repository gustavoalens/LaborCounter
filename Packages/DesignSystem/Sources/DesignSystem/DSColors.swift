import SwiftUI

public struct DSColors {
  public static var primary: Color { DesignSystem.theme.colors.primary }
  public static var secondary: Color { DesignSystem.theme.colors.secondary }
  public static var background: Color { DesignSystem.theme.colors.background }
  public static var accentBackground: Color { DesignSystem.theme.colors.accentBackground }
  public static var accent: Color { DesignSystem.theme.colors.accent }
}


struct DefaultColorTheme: ColorTheme {
  var primary: Color = Color("primary", bundle: Bundle.module)
  var secondary: Color = Color("secondary", bundle: Bundle.module)
  var background: Color = Color("background", bundle: Bundle.module)
  var accentBackground: Color = Color("accentBackground", bundle: Bundle.module)
  var accent: Color = Color("accent", bundle: Bundle.module)
}
