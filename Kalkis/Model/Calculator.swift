//
//  Calculator.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 12/09/2022.
//

import Foundation
import SwiftUI


struct CalculatorOperations {
    
    private struct mathOperationz: Equatable {
        var number: Decimal
        var operation: MathOperation
        
        func equalz(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .percent :
                return number/100*secondNumber
                
            case .divide:
                return number/secondNumber
            case .multiply:
                return number*secondNumber
            case .minus:
                return number-secondNumber
            case .plus:
                return number+secondNumber
                
            }
        }
    }
    
    
    private var newNumber: Decimal?
    private var expression: mathOperationz?
    private var result: Decimal?

    
    var displayedText : String {
        return getNumberAsString(forNumber: number, withCommas: true)
    }
    
    private var number: Decimal? {
        newNumber ?? expression?.number ?? result
    }
    
    mutating func putDigit(_ digit: Digits) {
        guard canAddDigit(digit) else {return}
        let numberString = getNumberAsString(forNumber: newNumber)
        newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
    }
    
    mutating func putMathOperation(_ operation: MathOperation) {
        guard var number = newNumber ?? result else { return }
        if let thatMathOperation = expression {
            number = thatMathOperation.equalz(with: number)
            
            expression = mathOperationz(number: number, operation: operation)
            
            newNumber = nil
        }
    }
    
    func toggleSign() {
        
    }
    
    func putPercent() {
        
    }
    
    func putComma() {
        
    }
    
    mutating func equalz() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.equalz(with: number)
        expression = nil
                newNumber = nil
    }
    
    func clearAll() {
        
    }
    
    func clear() {
        
    }
    
    private func getNumberAsString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        return (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
    }
    
    private func canAddDigit(_ digit: Digits) -> Bool {
        return number != nil || digit != .zero
    }
}
