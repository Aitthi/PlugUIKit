//
//  Environment.swift
//  
//
//  Created by Admin on 8/14/21.
//

import Foundation
import SwiftUI

struct PgUiColorThemeKey: EnvironmentKey {
    static let defaultValue: PgUiColorTheme = PgUiColorTheme()
}

struct LocalStatusBarStyleKey: EnvironmentKey {
    static let defaultValue: LocalStatusBarStyle = LocalStatusBarStyle()
}


extension EnvironmentValues {
    public var PgUiColorTheme:  PgUiColorTheme  {
        get {
            return self[PgUiColorThemeKey.self]
        }
    }
    public var localStatusBarStyle: LocalStatusBarStyle {
        get {
            return self[LocalStatusBarStyleKey.self]
        }
    }
}
