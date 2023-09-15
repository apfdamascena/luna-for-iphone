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
  internal static let menstruationSelected = ImageAsset(name: "MenstruationSelected")
  internal static let phase = ImageAsset(name: "Phase")
  internal static let pmsSelected = ImageAsset(name: "PmsSelected")
  internal static let arrowLeftIcon = ImageAsset(name: "arrow_left_icon")
  internal static let arrowRightIcon = ImageAsset(name: "arrow_right_icon")
  internal static let avatarImageFirstTimeNewActivity = ImageAsset(name: "avatar_image_first_time_new_activity")
  internal static let background = ImageAsset(name: "background")
  internal static let backgroundFirstTimeNewActivity = ImageAsset(name: "background_first_time_new_activity")
  internal static let backgroundFolicule1 = ImageAsset(name: "background_folicule_1")
  internal static let backgroundFolicule2 = ImageAsset(name: "background_folicule_2")
  internal static let backgroundFolicule3 = ImageAsset(name: "background_folicule_3")
  internal static let backgroundFolicule4 = ImageAsset(name: "background_folicule_4")
  internal static let backgroundFolicule5 = ImageAsset(name: "background_folicule_5")
  internal static let backgroundLuteal1 = ImageAsset(name: "background_luteal_1")
  internal static let backgroundLuteal2 = ImageAsset(name: "background_luteal_2")
  internal static let backgroundLuteal3 = ImageAsset(name: "background_luteal_3")
  internal static let backgroundLuteal4 = ImageAsset(name: "background_luteal_4")
  internal static let backgroundLuteal5 = ImageAsset(name: "background_luteal_5")
  internal static let backgroundMenstruation1 = ImageAsset(name: "background_menstruation_1")
  internal static let backgroundMenstruation2 = ImageAsset(name: "background_menstruation_2")
  internal static let backgroundMenstruation3 = ImageAsset(name: "background_menstruation_3")
  internal static let backgroundMenstruation4 = ImageAsset(name: "background_menstruation_4")
  internal static let backgroundMenstruation5 = ImageAsset(name: "background_menstruation_5")
  internal static let backgroundOvulation1 = ImageAsset(name: "background_ovulation_1")
  internal static let backgroundOvulation2 = ImageAsset(name: "background_ovulation_2")
  internal static let backgroundOvulation3 = ImageAsset(name: "background_ovulation_3")
  internal static let backgroundOvulation4 = ImageAsset(name: "background_ovulation_4")
  internal static let backgroundOvulation5 = ImageAsset(name: "background_ovulation_5")
  internal static let backgroundPms1 = ImageAsset(name: "background_pms_1")
  internal static let backgroundPms2 = ImageAsset(name: "background_pms_2")
  internal static let backgroundPms3 = ImageAsset(name: "background_pms_3")
  internal static let backgroundPms4 = ImageAsset(name: "background_pms_4")
  internal static let backgroundPms5 = ImageAsset(name: "background_pms_5")
  internal static let ball = ImageAsset(name: "ball")
  internal static let bestFolicular = ImageAsset(name: "best_folicular")
  internal static let bestLuteal = ImageAsset(name: "best_luteal")
  internal static let bestLutealB = ImageAsset(name: "best_luteal_b")
  internal static let bestMenstruation = ImageAsset(name: "best_menstruation")
  internal static let bestOvulation = ImageAsset(name: "best_ovulation")
  internal static let bestPms = ImageAsset(name: "best_pms")
  internal static let blueLine = ImageAsset(name: "blue-line")
  internal static let blueBall = ImageAsset(name: "blue_ball")
  internal static let calendarIcon = ImageAsset(name: "calendar-icon")
  internal static let calendarImage = ImageAsset(name: "calendarImage")
  internal static let chartPieIcon = ImageAsset(name: "chart_pie_icon")
  internal static let cinza100 = ColorAsset(name: "cinza-100")
  internal static let deadlineIcon = ImageAsset(name: "deadline_icon")
  internal static let dot11 = ColorAsset(name: "dot-1-1")
  internal static let dot12 = ColorAsset(name: "dot-1-2")
  internal static let dot13 = ColorAsset(name: "dot-1-3")
  internal static let dot1 = ImageAsset(name: "dot1")
  internal static let dot2 = ImageAsset(name: "dot2")
  internal static let dot3 = ImageAsset(name: "dot3")
  internal static let dot4 = ImageAsset(name: "dot4")
  internal static let dot5 = ImageAsset(name: "dot5")
  internal static let dotNone = ImageAsset(name: "dotNone")
  internal static let expectedMenstruationSelected = ImageAsset(name: "expectedMenstruationSelected")
  internal static let expectedPhaseActitivyCell = ImageAsset(name: "expected_phase_actitivy_cell")
  internal static let flowCardIndex0 = ImageAsset(name: "flowCardIndex0")
  internal static let flowCardIndex1 = ImageAsset(name: "flowCardIndex1")
  internal static let flowCardIndex2 = ImageAsset(name: "flowCardIndex2")
  internal static let flowCardIndex3 = ImageAsset(name: "flowCardIndex3")
  internal static let flowCardIndex4 = ImageAsset(name: "flowCardIndex4")
  internal static let foliculeCell = ImageAsset(name: "folicule_cell")
  internal static let foliculePhaseActivityCell = ImageAsset(name: "folicule_phase_activity_cell")
  internal static let follicularSelected = ImageAsset(name: "follicularSelected")
  internal static let forecastCell = ImageAsset(name: "forecast_cell")
  internal static let gray100 = ColorAsset(name: "gray_100")
  internal static let gray150 = ColorAsset(name: "gray_150")
  internal static let gray200 = ColorAsset(name: "gray_200")
  internal static let gray400 = ColorAsset(name: "gray_400")
  internal static let gray50 = ColorAsset(name: "gray_50")
  internal static let gray500 = ColorAsset(name: "gray_500")
  internal static let gray950 = ColorAsset(name: "gray_950")
  internal static let imageNoData = ImageAsset(name: "image_no_data")
  internal static let landingPageBackgroundImage = ImageAsset(name: "landingPageBackgroundImage")
  internal static let logo = ImageAsset(name: "logo")
  internal static let lutealSelected = ImageAsset(name: "lutealSelected")
  internal static let lutealCell = ImageAsset(name: "luteal_cell")
  internal static let lutealPhaseActivityCell = ImageAsset(name: "luteal_phase_activity_cell")
  internal static let menstruationCell = ImageAsset(name: "menstruation_cell")
  internal static let menstruationPhaseActivityCell = ImageAsset(name: "menstruation_phase_activity_cell")
  internal static let noneSelected = ImageAsset(name: "noneSelected")
  internal static let notificationRequestImage = ImageAsset(name: "notification-request-image")
  internal static let otherCyclePhases = ImageAsset(name: "other_cycle_phases")
  internal static let ovulationSelected = ImageAsset(name: "ovulationSelected")
  internal static let ovulationCell = ImageAsset(name: "ovulation_cell")
  internal static let ovulationPhaseActivityCell = ImageAsset(name: "ovulation_phase_activity_cell")
  internal static let pencilIcon = ImageAsset(name: "pencil_icon")
  internal static let plusIcon = ImageAsset(name: "plus_icon")
  internal static let pmsCell = ImageAsset(name: "pms_cell")
  internal static let pmsPhaseActivityCell = ImageAsset(name: "pms_phase_activity_cell")
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
