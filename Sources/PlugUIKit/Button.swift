//
//  Button.swift
//  
//
//  Created by Admin on 8/12/21.
//

import Foundation
import SwiftUI

public struct PgUiButton: View{
    
    public enum PgUiButtonSize {
        case small
        case `default`
        case large
        
        public var FontSize: CGFloat {
            switch self {
            case .default:
                return 20
            case .small:
                return 16
            case .large:
                return 23
            }
        }
        
        public var Height: CGFloat {
            switch self {
            case .default:
                return 40
            case .small:
                return 36
            case .large:
                return 44
            }
        }
    }
    
    public enum PgUiButtonWidth:  CustomStringConvertible {
        case `default`
        case block
        case full
        
        public var description: String{
            switch self {
            case .default:
                return "Button Default."
            case .block:
                return "Button Block width."
            case .full:
                return "Button Full display."
            }
        }
    }
    
    public enum PgUiButtonStyle:  CustomStringConvertible {
        case `default`
        case light
        case lightFill
        case lightOutline
        
        public var description: String{
            switch self {
            case .default:
                return ""
            case .light:
                return ""
            case .lightOutline:
                return ""
            case .lightFill:
                return ""
            }
        }
        
    }


    private var Label: String
    private var ColorType: PgUiColor = .default
    private var Size: PgUiButtonSize = .default
    private var Width: PgUiButtonWidth = .default
    private var Style: PgUiButtonStyle = .default

    // Actios
    private var action:  () -> Void
    
    public init(Label: String,
                ColorType: PgUiColor = .default,
                Size: PgUiButtonSize = .default, Width: PgUiButtonWidth = .default,
                Style: PgUiButtonStyle = .default, action: @escaping () -> Void){
        
        self.Label = Label
        self.ColorType = ColorType
        self.Size = Size
        self.Width = Width
        self.Style = Style
        self.action = action
        
    }


    // Private
    private let UISize = UIScreen.main.bounds
    public var _cornerRadius: CGFloat = 10
    
    public var body: some View{
        
        if(self.Width == .default){
            if(self.Style == .default){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Text)
                    .frame(height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Background)
                .cornerRadius(self._cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                            .stroke(self.ColorType.Background, lineWidth: 2))
            }
        
            if(self.Style == .light){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Background)
                .frame(height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Background.opacity(0))
                .cornerRadius(self._cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                            .stroke(self.ColorType.Background, lineWidth: 2))
            }
        
            if(self.Style == .lightOutline){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Text)
                .frame(height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Background.opacity(0))
                .cornerRadius(self._cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                            .stroke(self.ColorType.Text, lineWidth: 2))
            }
        
            if(self.Style == .lightFill){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Background)
                .frame(height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Text)
                .cornerRadius(self._cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                            .stroke(self.ColorType.Text, lineWidth: 2))
            }
        }
        
        if(self.Width == .block){
            GeometryReader { geo in
                if(self.Style == .default){
                    Button(self.Label, action: self.action)
                    .font(.system(size: self.Size.FontSize))
                    .padding(.horizontal, 16)
                    .foregroundColor(self.ColorType.Text)
                        .frame(width: geo.size.width, height: self.Size.Height, alignment: .center)
                    .background(self.ColorType.Background)
                    .cornerRadius(self._cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                                .stroke(self.ColorType.Background, lineWidth: 2))
                }
            
                if(self.Style == .light){
                    Button(self.Label, action: self.action)
                    .font(.system(size: self.Size.FontSize))
                    .padding(.horizontal, 16)
                    .foregroundColor(self.ColorType.Background)
                    .frame(width: geo.size.width, height: self.Size.Height, alignment: .center)
                    .background(self.ColorType.Background.opacity(0))
                    .cornerRadius(self._cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                                .stroke(self.ColorType.Background, lineWidth: 2))
                }
            
                if(self.Style == .lightOutline){
                    Button(self.Label, action: self.action)
                    .font(.system(size: self.Size.FontSize))
                    .padding(.horizontal, 16)
                    .foregroundColor(self.ColorType.Text)
                    .frame(width: geo.size.width, height: self.Size.Height, alignment: .center)
                    .background(self.ColorType.Background.opacity(0))
                    .cornerRadius(self._cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                                .stroke(self.ColorType.Text, lineWidth: 2))
                }
            
                if(self.Style == .lightFill){
                    Button(self.Label, action: self.action)
                    .font(.system(size: self.Size.FontSize))
                    .padding(.horizontal, 16)
                    .foregroundColor(self.ColorType.Background)
                    .frame(width: geo.size.width, height: self.Size.Height, alignment: .center)
                    .background(self.ColorType.Text)
                    .cornerRadius(self._cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: self._cornerRadius)
                                .stroke(self.ColorType.Text, lineWidth: 2))
                }
            }
        }
        
        if(self.Width == .full){
            if(self.Style == .default){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Text)
                    .frame(width: UISize.width-10, height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Background)
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(self.ColorType.Background, lineWidth: 2))
            }
        
            if(self.Style == .light){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Background)
                .frame(width: UISize.width-10, height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Background.opacity(0))
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(self.ColorType.Background, lineWidth: 2))
            }
        
            if(self.Style == .lightOutline){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Text)
                .frame(width: UISize.width-10, height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Background.opacity(0))
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(self.ColorType.Text, lineWidth: 2))
            }
        
            if(self.Style == .lightFill){
                Button(self.Label, action: self.action)
                .font(.system(size: self.Size.FontSize))
                .padding(.horizontal, 16)
                .foregroundColor(self.ColorType.Background)
                .frame(width: UISize.width-10, height: self.Size.Height, alignment: .center)
                .background(self.ColorType.Text)
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(self.ColorType.Text, lineWidth: 2))
            }
        }
        
    }
}

extension PgUiButton{

    mutating func cornerRadius(_ radius: CGFloat){
        self._cornerRadius = radius
    }

}

