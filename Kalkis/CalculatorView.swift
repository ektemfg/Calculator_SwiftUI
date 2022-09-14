//
//  ContentView.swift
//  Kalkis
//
//  Created by Dimitrije Pesic on 09/09/2022.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject  private var viewModel: ViewModel

    
    var buttonTypes: [[ButtonType]] {
        [[.allClear, .negative, .percent, .operation(.divide)],
         [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiply)],
         [.digit(.four), .digit(.five), .digit(.six), .operation(.minus)],
         [.digit(.one), .digit(.two), .digit(.three), .operation(.plus)],
         [.digit(.zero), .coma,.equals]]
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text(viewModel.displayedText)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity,alignment: .trailing)
                .font(.system(size: 80.0, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
            ForEach(buttonTypes, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { buttonType in
                        if buttonType.description == "0" {
                            Button(buttonType.description) {
                                viewModel.action(for: .digit(Digits(rawValue: 0)!))
                            }
                                .buttonStyle(CalculatorButtonStyle(
                                    size: 85, backgroundColor: buttonType.buttonColor, foregroundColor: buttonType.buttonForeground,height: 70, width: 180))
                            
                        } else {
                            Button(buttonType.description){
                                switch buttonType {
                                case .digit(_):
                                    switch buttonType.description {
                                    case "1":
                                        viewModel.action(for: .digit(Digits(rawValue: 1)!))
                                    case "2":
                                        viewModel.action(for: .digit(Digits(rawValue: 2)!))
                                    case "3":
                                        viewModel.action(for: .digit(Digits(rawValue: 3)!))
                                    case "4":
                                        viewModel.action(for: .digit(Digits(rawValue: 4)!))
                                    case "5":
                                        viewModel.action(for: .digit(Digits(rawValue: 5)!))
                                    case "6":
                                        viewModel.action(for: .digit(Digits(rawValue: 6)!))
                                    case "7":
                                        viewModel.action(for: .digit(Digits(rawValue: 7)!))
                                    case "8":
                                        viewModel.action(for: .digit(Digits(rawValue: 8)!))
                                    case "9":
                                        viewModel.action(for: .digit(Digits(rawValue: 9)!))
                                    default:
                                        "None"
                                    }
                                    
                                case .operation(_):
                                    switch buttonType.description {
                                    case "x":
                                        viewModel.action(for: .operation(.multiply))
                                    case "÷":
                                        viewModel.action(for: .operation(.divide))
                                    case "-":
                                        viewModel.action(for: .operation(.minus))
                                    case "+":
                                        viewModel.action(for: .operation(.plus))
                                    default:
                                        "None"
                                    }
                                case .negative:
                                    viewModel.action(for: .negative)
                                case .percent:
                                    viewModel.action(for: .percent)
                                case .coma:
                                    viewModel.action(for: .coma)
                                case .equals:
                                    viewModel.action(for: .equals)
                                case .allClear:
                                    viewModel.action(for: .allClear)
                                case .clear:
                                    viewModel.action(for: .clear)
                                }
                            }
                            .buttonStyle(CalculatorButtonStyle(
                                size: 85, backgroundColor: buttonType.buttonColor, foregroundColor: buttonType.buttonForeground))
                            
                    }
                    }
                }
               
            }
        }
        .background(Color.black)
    }
    

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
}
