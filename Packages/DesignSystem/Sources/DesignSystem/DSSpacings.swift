import SwiftUI

public struct DSSpacings {
  public struct Stack {
    public static var large: CGFloat { DesignSystem.theme.spacings.stack.large }
    public static var normal: CGFloat { DesignSystem.theme.spacings.stack.normal }
    public static var small: CGFloat { DesignSystem.theme.spacings.stack.small }
    public static var xsmall: CGFloat { DesignSystem.theme.spacings.stack.xsmall }
  }
  
  public struct Inline {
    public static var large: CGFloat { DesignSystem.theme.spacings.inline.large }
    public static var normal: CGFloat { DesignSystem.theme.spacings.inline.normal }
    public static var small: CGFloat { DesignSystem.theme.spacings.inline.small }
    public static var xsmall: CGFloat { DesignSystem.theme.spacings.inline.xsmall }
  }
}

struct DefaultSpacingTheme: SpacingTheme {
  var stack: any StackSpacingTheme = DefaultStackSpacing()
  var inline: any InlineSpacingTheme = DefaultInlineSpacing()
}

struct DefaultStackSpacing: StackSpacingTheme {
  let large: CGFloat = 24.0
  let normal: CGFloat = 16.0
  let small: CGFloat = 8.0
  let xsmall: CGFloat = 4.0
}

struct DefaultInlineSpacing: InlineSpacingTheme {
  let large: CGFloat = 24.0
  let normal: CGFloat = 16.0
  let small: CGFloat = 8.0
  let xsmall: CGFloat = 4.0
}
