// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Constants {
    internal enum Content {
      internal enum Button {
        /// Continuar
        internal static let `continue` = L10n.tr("Constants", "constants.content.button.continue", fallback: "Continuar")
      }
      internal enum Label {
        /// Permita que o Luna acesse seu Calendar para planejar seus dias com sabedoria e melhorar o seu bem-estar
        internal static let calendarSubtitle = L10n.tr("Constants", "constants.content.label.calendar_subtitle", fallback: "Permita que o Luna acesse seu Calendar para planejar seus dias com sabedoria e melhorar o seu bem-estar")
        /// Consiga ver seu ciclo
        /// no seu dia a dia
        internal static let calendarTitle = L10n.tr("Constants", "constants.content.label.calendar_title", fallback: "Consiga ver seu ciclo\nno seu dia a dia")
        /// Constants.strings
        ///   luna
        /// 
        ///   Created by alexdamascena on 18/07/23.
        internal static let lastDayMenstruation = L10n.tr("Constants", "constants.content.label.last_day_menstruation", fallback: "Quando foi o início da\nsua última menstruação?")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
