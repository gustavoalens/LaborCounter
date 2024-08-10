import SwiftUI

public struct DSSpacings {
  public struct Stack {
    static var large: CGFloat { 24.0 }
    static var normal: CGFloat { 16.0 }
    static var small: CGFloat { 8.0 }
    static var xsmall: CGFloat { 4.0 }
  }
  
  public struct Inline {
    static var large: CGFloat { 24.0 }
    static var normal: CGFloat { 16.0 }
    static var small: CGFloat { 8.0 }
    static var xsmall: CGFloat { 4.0 }
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
