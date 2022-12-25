//
//  CalculatorButton.swift
//  ProgrammaticallyCalculator_FC
//
//  Created by Filipe Rogério Canzi da Silva on 23/12/22.
//

import UIKit


protocol CalculatorButtonDelegate {
    
    func dotWasPressed()
    func numberWasPressed(number: CalculatorNumber)
    func operationWasPressed(operation: CalculatorOperation)
    func controlWasPressed(control: CalculatorControl)
    
}


class CalculatorButton: UIButton {
    
    var symbol: CalculatorSymbol = .n0
    var delegate: CalculatorButtonDelegate?
    
    func configureButtonBySymbol(withSymbol symbol: CalculatorSymbol) {
        
        self.symbol = symbol
        
        switch symbol {
            
        case .add, .subtract, .multiply, .divide:
            self.backgroundColor = .operationColor
            self.addTarget(self, action: #selector(operationSelector), for: .touchUpInside)
            
        case .equal:
            self.backgroundColor = .operationColor
            self.addTarget(self, action: #selector(controlSelector), for: .touchUpInside)
            
        case .ac, .percent, .changeSign:
            self.backgroundColor = .controlColor
            self.addTarget(self, action: #selector(controlSelector), for: .touchUpInside)
            
        case .n0, .n1, .n2, .n3, .n4, .n5, .n6, .n7, .n8, .n9:
            self.backgroundColor = .numberColor
            self.addTarget(self, action: #selector(numberSelector), for: .touchUpInside)
            
        case .dot:
            self.backgroundColor = .numberColor
            self.addTarget(self, action: #selector(dotSelector), for: .touchUpInside)
            
        }
        
    }
    
    
    @objc func operationSelector() {
                
        switch symbol {
            
        case .add:
            delegate?.operationWasPressed(operation: .add)
        case .subtract:
            delegate?.operationWasPressed(operation: .subtract)
        case .multiply:
            delegate?.operationWasPressed(operation: .multiply)
        case .divide:
            delegate?.operationWasPressed(operation: .divide)
        default:
            print("ERROR IN OPERATION SELECTOR")
        }
        
        
    }
    
    
    @objc func numberSelector() {
        
        switch symbol {
            
        case .n0:
            delegate?.numberWasPressed(number: .n0)
        case .n1:
            delegate?.numberWasPressed(number: .n1)
        case .n2:
            delegate?.numberWasPressed(number: .n2)
        case .n3:
            delegate?.numberWasPressed(number: .n3)
        case .n4:
            delegate?.numberWasPressed(number: .n4)
        case .n5:
            delegate?.numberWasPressed(number: .n5)
        case .n6:
            delegate?.numberWasPressed(number: .n6)
        case .n7:
            delegate?.numberWasPressed(number: .n7)
        case .n8:
            delegate?.numberWasPressed(number: .n8)
        case .n9:
            delegate?.numberWasPressed(number: .n9)
        default:
            print("ERROR IN NUMBER SELECTOR")
        }
        
    }
    

    @objc func controlSelector() {
        
        switch symbol {
        
        case .equal:
            delegate?.controlWasPressed(control: .equal)
        case .ac:
            delegate?.controlWasPressed(control: .ac)
        case .percent:
            delegate?.controlWasPressed(control: .percent)
        case .changeSign:
            delegate?.controlWasPressed(control: .changeSign)
        
        default:
            print("ERROR IN CONTROL SELECTOR")
        }
        
    }
    
    @objc func dotSelector() {
        delegate?.dotWasPressed()
    }
    
}
