//
//  Digits.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 09/09/2022.
//

import Foundation

enum Digits: Int, CaseIterable, CustomStringConvertible {
case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"}
}
