//
//  ViewModel.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 12/09/2022.
//
import SwiftUI
import Foundation
import Combine

extension CalculatorView {
    
   final class ViewModel: ObservableObject {
        
        @Published var calculator = CalculatorOperations()
        
        var displayedText: String {
            return calculator.displayedText
            }
        
        
        
       var buttonTypes: [[ButtonType]] {
           [[.allClear, .negative, .percent, .operation(.divide)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiply)],
            [.digit(.four), .digit(.five), .digit(.six), .operation(.minus)],
            [.digit(.one), .digit(.two), .digit(.three), .operation(.plus)],
            [.digit(.zero), .coma,.equals]]
       }
                    
       
       
       func action(for buttonType: ButtonType) {
           switch buttonType {
           case .digit(let digit):
               calculator.putDigit(digit)
           case .operation(let operation):
               calculator.putMathOperation(operation)
           case .negative:
               calculator.toggleSign()
           case .percent:
               calculator.putPercent()
           case .coma:
               calculator.putComma()
           case .equals:
               calculator.equalz()
           case .allClear:
               calculator.clearAll()
           case .clear:
               calculator.clear()
           }
           
       }
    }
    
}

