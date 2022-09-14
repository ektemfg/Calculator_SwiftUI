//
//  CalculatorButtonStyle.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 09/09/2022.
//

import SwiftUI
struct CalculatorButtonStyle: ButtonStyle {
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var height: CGFloat?
    var width: CGFloat?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 32, weight: .medium))
            .frame(width: width ?? size, height: height ?? size)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay{
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                }
            }
            .clipShape(Capsule())
    }
}
struct CalculatorButtonStyle_Previews: PreviewProvider {
    static let buttonType: ButtonType = .digit(.four)
    
    static var previews: some View {
        Button(buttonType.description) { }
            .buttonStyle(CalculatorButtonStyle(
                size: 80,
                backgroundColor: buttonType.buttonColor,
                foregroundColor: buttonType.buttonForeground)
            )
    }
}
