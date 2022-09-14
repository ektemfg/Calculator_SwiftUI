//
//  Buttons.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 09/09/2022.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digits)
    case operation(_ operation: MathOperation)
    case negative
    case percent
    case coma
    case equals
    case allClear
    case clear
    
    var description: String {
        switch self {
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .negative:
            return "+/-"
        case .percent:
            return "%"
        case .coma:
            return ","
        case .equals:
         return "="
        case .allClear:
            return "AC"
        case .clear:
            return "C"
        }
    }
    
    var buttonForeground: Color {
        switch self {
        case .clear, .allClear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
    var buttonColor: Color {
            switch self {
            case .allClear, .clear, .negative, .percent:
                return Color(.lightGray)
            case .operation, .equals:
                return .orange
            case .digit, .coma:
                return .secondary
            }
        }
}
