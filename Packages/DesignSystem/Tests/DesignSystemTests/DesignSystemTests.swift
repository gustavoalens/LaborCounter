import XCTest
@testable import DesignSystem

final class DesignSystemTests: XCTestCase {
  
  private var testTheme: Theme = TestTheme()
  
  override func setUpWithError() throws {
    DesignSystem.start(theme: testTheme)
    try super.setUpWithError()
  }
  
  func testColorsTheme() throws {
    let testColorTheme = testTheme.colors
    XCTAssert(testColorTheme.primary == DSColors.primary, "expected \(testColorTheme.primary); actual \(DSColors.primary)")
    XCTAssert(testColorTheme.secondary == DSColors.secondary, "expected \(testColorTheme.secondary); actual \(DSColors.secondary)")
    XCTAssert(testColorTheme.accent == DSColors.accent, "expected \(testColorTheme.accent); actual \(DSColors.accent)")
    XCTAssert(testColorTheme.background == DSColors.background, "expected \(testColorTheme.background); actual \(DSColors.background)")
  }
  
  func testStackSpacingTheme() throws {
    let testStackSpacingTheme = testTheme.spacings.stack
    XCTAssert(testStackSpacingTheme.large == DSSpacings.Stack.large, "expected \(testStackSpacingTheme.large); actual \(DSSpacings.Stack.large)")
    XCTAssert(testStackSpacingTheme.normal == DSSpacings.Stack.normal, "expected \(testStackSpacingTheme.normal); actual \(DSSpacings.Stack.normal)")
    XCTAssert(testStackSpacingTheme.small == DSSpacings.Stack.small, "expected \(testStackSpacingTheme.small); actual \(DSSpacings.Stack.small)")
    XCTAssert(testStackSpacingTheme.xsmall == DSSpacings.Stack.xsmall, "expected \(testStackSpacingTheme.xsmall); actual \(DSSpacings.Stack.xsmall)")
  }
  
  func testInlineSpacingTheme() throws {
    let testInlineSpacingTheme = testTheme.spacings.inline
    XCTAssert(testInlineSpacingTheme.large == DSSpacings.Inline.large, "expected \(testInlineSpacingTheme.large); actual \(DSSpacings.Inline.large)")
    XCTAssert(testInlineSpacingTheme.normal == DSSpacings.Inline.normal, "expected \(testInlineSpacingTheme.normal); actual \(DSSpacings.Inline.normal)")
    XCTAssert(testInlineSpacingTheme.small == DSSpacings.Inline.small, "expected \(testInlineSpacingTheme.small); actual \(DSSpacings.Inline.small)")
    XCTAssert(testInlineSpacingTheme.xsmall == DSSpacings.Inline.xsmall, "expected \(testInlineSpacingTheme.xsmall); actual \(DSSpacings.Inline.xsmall)")
  }
}

import SwiftUI

struct TestTheme: Theme {
  let colors: any ColorTheme = TestColorTheme()
  var spacings: any SpacingTheme = TestSpacingTheme()
}

struct TestColorTheme: ColorTheme {
  let primary: Color = .black
  let secondary: Color = .blue
  let background: Color = .red
  let accent: Color = .brown
}

struct TestSpacingTheme: SpacingTheme {
  var stack: any StackSpacingTheme = TestStackSpacingTheme()
  var inline: any InlineSpacingTheme = TestInlineSpacingTheme()
}

struct TestStackSpacingTheme: StackSpacingTheme {
  var large: CGFloat = CGFloat.random(in: 0...10000)
  var normal: CGFloat = CGFloat.random(in: 0...10000)
  var small: CGFloat = CGFloat.random(in: 0...10000)
  var xsmall: CGFloat = CGFloat.random(in: 0...10000)
}
struct TestInlineSpacingTheme: InlineSpacingTheme {
  var large: CGFloat = CGFloat.random(in: 0...10000)
  var normal: CGFloat = CGFloat.random(in: 0...10000)
  var small: CGFloat = CGFloat.random(in: 0...10000)
  var xsmall: CGFloat = CGFloat.random(in: 0...10000)
}
