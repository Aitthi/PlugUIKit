//
//  Color.swift
//  
//
//  Created by Admin on 8/12/21.
//

import Foundation
import SwiftUI

public class PgUiColorTheme{
    
    // Main
    public var primaryColor: String = "#5539b4"
    public var secondaryColor: String = "#7354eb"
    public var tertiaryColor: String = "#372e68"
    public var successColor: String = "#48c78e"
    public var warningColor: String = "#ffd560"
    public var dangerColor: String = "#f14668"
    public var lightColor: String = "#f4f5f8"
    public var darkColor: String = "#1f2330"
    
    // Text
    public var primaryColorText: String = "#fff"
    public var secondaryColorText: String = "#fff"
    public var tertiaryColorText: String = "#fff"
    public var successColorText: String = "#fff"
    public var warningColorText: String = "#000"
    public var dangerColorText: String = "#fff"
    public var lightColorText: String = "#1f2330"
    public var darkColorText: String = "#fff"
    
}

public enum PgUiColor{

    @Environment(\.PgUiColorTheme) static var pgUiColorTheme: PgUiColorTheme
    
    case `default`
    case primary
    case secondary
    case tertiary
    case success
    case warning
    case danger
    case light
    case dark
    case custom(BackgroundHex: String, TextHex: String = "#fff")

    public var Background:  Color  {
        switch self {
        case .default, .primary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.primaryColor)
        case .secondary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.secondaryColor)
        case .tertiary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.tertiaryColor)
        case .success:
            return Color.init(hex: PgUiColor.pgUiColorTheme.successColor)
        case .warning:
            return Color.init(hex: PgUiColor.pgUiColorTheme.warningColor)
        case .danger:
            return Color.init(hex: PgUiColor.pgUiColorTheme.dangerColor)
        case .light:
            return Color.init(hex: PgUiColor.pgUiColorTheme.lightColor)
        case .dark:
            return Color.init(hex: PgUiColor.pgUiColorTheme.darkColor)
        case .custom(let BackgroundHex, _):
            return Color.init(hex: BackgroundHex)
        }
    }
    
    public var Text: Color {
        switch self {
        case .default, .primary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.primaryColorText)
        case .secondary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.secondaryColorText)
        case .tertiary:
            return Color.init(hex: PgUiColor.pgUiColorTheme.tertiaryColorText)
        case .success:
            return Color.init(hex: PgUiColor.pgUiColorTheme.successColorText)
        case .warning:
            return Color.init(hex: PgUiColor.pgUiColorTheme.warningColorText)
        case .danger:
            return Color.init(hex: PgUiColor.pgUiColorTheme.dangerColorText)
        case .light:
            return Color.init(hex: PgUiColor.pgUiColorTheme.lightColorText)
        case .dark:
            return Color.init(hex: PgUiColor.pgUiColorTheme.darkColorText)
        case .custom(_, let TextHex):
            return Color.init(hex: TextHex)
        }
    }
    
}

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
