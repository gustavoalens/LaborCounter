import SwiftUI

public protocol Theme {
  var colors: ColorTheme { get }
  var spacings: SpacingTheme { get }
}

public protocol ColorTheme {
  var primary: Color { get }
  var secondary: Color { get }
  var background: Color { get }
  var accent: Color { get }
}

public protocol SpacingTheme {
  var stack: StackSpacingTheme { get }
  var inline: InlineSpacingTheme { get }
}

public protocol StackSpacingTheme {
  var large: CGFloat { get }
  var normal: CGFloat { get }
  var small: CGFloat { get }
  var xsmall: CGFloat { get }
}

public protocol InlineSpacingTheme {
  var large: CGFloat { get }
  var normal: CGFloat { get }
  var small: CGFloat { get }
  var xsmall: CGFloat { get }
}

struct DefaultTheme: Theme {
  let colors: any ColorTheme = DefaultColorTheme()
  let spacings: any SpacingTheme = DefaultSpacingTheme()
}
