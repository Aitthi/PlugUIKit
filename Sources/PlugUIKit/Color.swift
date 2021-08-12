//
//  Color.swift
//  
//
//  Created by Admin on 8/12/21.
//

import Foundation
import SwiftUI

extension Color {
    
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
}

public class PgUiColorTheme{
    
    // Main
    public var primaryColor: String = "#5539b4"
    public var secondaryColor: String = "#7354eb"
    public var tertiaryColor: String = "#372e68"
    
    // Text
    public var primaryColorText: String = "#fff"
    public var secondaryColorText: String = "#fff"
    public var tertiaryColorText: String = "#fff"
}

struct PgUiColorThemeKey: EnvironmentKey {
    static let defaultValue: PgUiColorTheme = PgUiColorTheme()
}

extension EnvironmentValues {
    public var PgUiColorTheme:  PgUiColorTheme  {
        get {
            return self[PgUiColorThemeKey.self]
        }
    }
}

public enum PgUiColor:  CustomStringConvertible {

    @Environment(\.PgUiColorTheme) static var pgUiColorTheme: PgUiColorTheme
    
    case `default`
    case primary
    case secondary
    case tertiary
    case custom(BackgroundHex: String, TextHex: String = "#fff")
    
//    #7354eb,#5539b4,#372e68
    
    public var description: String{
        switch self {
        case .default, .primary:
            return "Primary color."
        case .secondary:
            return "Secondary color."
        case .tertiary:
            return "Tertiary color."
        case .custom:
            return "custom color."
        }
    }

    public var Background: Color{
        switch self {
        case .default, .primary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.primaryColor)
        case .secondary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.secondaryColor)
        case .tertiary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.tertiaryColor)
        case .custom(let BackgroundHex, _):
            return Color.init(hex: BackgroundHex)
        }
    }
    
    public var Text: Color{
        switch self {
        case .default, .primary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.primaryColorText)
        case .secondary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.secondaryColorText)
        case .tertiary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.tertiaryColorText)
        case .custom(_, let TextHex):
            return Color.init(hex: TextHex)
        }
    }
    
}
