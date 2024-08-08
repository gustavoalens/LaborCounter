import SwiftUI

public final class DSColors {
  public static let primary: Color = Color("primary", bundle: Bundle.module)
  public static let secondary: Color = Color("secondary", bundle: Bundle.module)
  public static let background: Color = Color("background", bundle: Bundle.module)
  public static let accent: Color = Color("accent", bundle: Bundle.module)
}


//import class Foundation.Bundle
//import class Foundation.ProcessInfo
//import struct Foundation.URL
//
//private class BundleFinder {}
//
//extension Foundation.Bundle {
//  /// Returns the resource bundle associated with the current Swift module.
//  static let module: Bundle = {
//    let bundleName = "YourPackageName_YourTargetName"
//    
//    let overrides: [URL]
//#if DEBUG
//    if let override = ProcessInfo.processInfo.environment["PACKAGE_RESOURCE_BUNDLE_URL"] {
//      overrides = [URL(fileURLWithPath: override)]
//    } else {
//      overrides = []
//    }
//#else
//    overrides = []
//#endif
//    
//    let candidates = overrides + [
//      // Bundle should be present here when the package is linked into an App.
//      Bundle.main.resourceURL,
//      
//      // Bundle should be present here when the package is linked into a framework.
//      Bundle(for: BundleFinder.self).resourceURL,
//      
//      // For command-line tools.
//      Bundle.main.bundleURL,
//    ]
//    
//    for candidate in candidates {
//      let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
//      if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
//        return bundle
//      }
//    }
//    fatalError("unable to find bundle named YourPackageName_YourTargetName")
//  }()
//}
