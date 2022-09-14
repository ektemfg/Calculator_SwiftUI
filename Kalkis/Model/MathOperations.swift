//
//  MathOperations.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 09/09/2022.
//

import Foundation
import SwiftUI

enum MathOperation: CaseIterable, CustomStringConvertible {
case percent, divide, multiply, minus, plus
    
    var description: String {
        switch self {
        case .percent:
            return "%"
            
        case .divide:
            return "÷"
            
        case .multiply:
            return "x"
            
        case .minus:
            return "-"
            
        case .plus:
            return "+"
            
        }
    }
    
}



