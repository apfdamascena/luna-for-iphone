// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let color1 = ColorAsset(name: "Color 1")
  internal static let color = ColorAsset(name: "Color")
  internal static let menstruationSelected = ImageAsset(name: "MenstruationSelected")
  internal static let arrowLeftIcon = ImageAsset(name: "arrow_left_icon")
  internal static let background = ImageAsset(name: "background")
  internal static let ball = ImageAsset(name: "ball")
  internal static let blueLine = ImageAsset(name: "blue-line")
  internal static let blueBall = ImageAsset(name: "blue_ball")
  internal static let calendarIcon = ImageAsset(name: "calendar-icon")
  internal static let calendarImage = ImageAsset(name: "calendarImage")
  internal static let cinza100 = ColorAsset(name: "cinza-100")
  internal static let foliculeCell = ImageAsset(name: "folicule_cell")
  internal static let follicularSelected = ImageAsset(name: "follicularSelected")
  internal static let forecastCell = ImageAsset(name: "forecast_cell")
  internal static let gray100 = ColorAsset(name: "gray_100")
  internal static let gray150 = ColorAsset(name: "gray_150")
  internal static let gray200 = ColorAsset(name: "gray_200")
  internal static let landingPageBackgroundImage = ImageAsset(name: "landingPageBackgroundImage")
  internal static let logo = ImageAsset(name: "logo")
  internal static let lutealSelected = ImageAsset(name: "lutealSelected")
  internal static let lutealCell = ImageAsset(name: "luteal_cell")
  internal static let menstruationCell = ImageAsset(name: "menstruation_cell")
  internal static let noneSelected = ImageAsset(name: "noneSelected")
  internal static let otherCyclePhases = ImageAsset(name: "other_cycle_phases")
  internal static let ovulationSelected = ImageAsset(name: "ovulationSelected")
  internal static let ovulationCell = ImageAsset(name: "ovulation_cell")
  internal static let previsionSelected = ImageAsset(name: "previsionSelected")
  internal static let primaryGray900 = ColorAsset(name: "primary_gray_900")
  internal static let primaryRed500 = ColorAsset(name: "primary_red_500")
  internal static let primaryRed900 = ColorAsset(name: "primary_red_900")
  internal static let red100 = ColorAsset(name: "red-100")
  internal static let red200 = ColorAsset(name: "red-200")
  internal static let red400 = ColorAsset(name: "red-400")
  internal static let red500 = ColorAsset(name: "red-500")
  internal static let red600 = ColorAsset(name: "red-600")
  internal static let redLine = ImageAsset(name: "red-line")
  internal static let secondaryRed100 = ColorAsset(name: "secondary_red_100")
  internal static let secondaryRed200 = ColorAsset(name: "secondary_red_200")
  internal static let teachRegisterMenstruation = ImageAsset(name: "teach_register_menstruation")
  internal static let vermelho200 = ColorAsset(name: "vermelho-200")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
