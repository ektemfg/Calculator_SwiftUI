//
//  Calculator.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 12/09/2022.
//

import Foundation
import SwiftUI


class CalculatorOperations {
    
    private var newNumber: Decimal?

    
    var displayedText : String {
        return getNumberAsString(forNumber: number, withCommas: true)
    }
    
    private var number: Decimal? {
        newNumber
    }
    
    func putDigit(_ digit: Digits) {
        guard canAddDigit(digit) else {return}
        let numberString = getNumberAsString(forNumber: newNumber)
        newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
    }
    
    func putMathOperation(_ mathOperation: MathOperation) {
        print(mathOperation)
    }
    
    func toggleSign() {
        
    }
    
    func putPercent() {
        
    }
    
    func putComma() {
        
    }
    
    func equalz() {
        
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
