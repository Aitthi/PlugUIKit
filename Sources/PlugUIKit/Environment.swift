//
//  Environment.swift
//  
//
//  Created by Admin on 8/14/21.
//

import Foundation
import SwiftUI

public class PgUiColorTheme{
    
    // Main
    public var primaryColor: String = "#5539b4"
    public var secondaryColor: String = "#7354eb"
    public var tertiaryColor: String = "#372e68"
    public var successColor: String = "#2dd36f"
    public var warningColor: String = "#ffc409"
    public var dangerColor: String = "#eb445a"
    public var lightColor: String = "#f4f5f8"
    public var darkColor: String = "#222428"
    
    // Text
    public var primaryColorText: String = "#fff"
    public var secondaryColorText: String = "#fff"
    public var tertiaryColorText: String = "#fff"
    public var successColorText: String = "#fff"
    public var warningColorText: String = "#000"
    public var dangerColorText: String = "#fff"
    public var lightColorText: String = "#000"
    public var darkColorText: String = "#fff"
    
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
