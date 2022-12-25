//
//  CalculatorManager.swift
//  ProgrammaticallyCalculator_FC
//
//  Created by Filipe Rogério Canzi da Silva on 25/12/22.
//

import Foundation

protocol CalculatorManagerDelegate {
    
    func updateResultLabel(display: [String])
    
}


class CalculatorManager {
    
    var delegate: CalculatorManagerDelegate?
    
    var memoryFloatValue: Float? = nil
    var displayArray: [String] = ["0"]
    var displayFloatValue: Float? = 0
    
    var calculatorIsClear: Bool = true
    var isPositiveNumber: Bool = true
    
    var dotIsOnDisplay: Bool = false
    var waitingForNextNumberToStart: Bool? = nil
    var divisionByZeroWasMade: Bool = false
    
    var operationSelected: CalculatorOperation? = nil
    
    
}


// MARK: - CalculatorButtonDelegate Methods
extension CalculatorManager: CalculatorButtonDelegate {
    

    func numberWasPressed(number: CalculatorNumber) {
        
        if divisionByZeroWasMade {
            return
        }
        
        else if number == .n0 && displayArray == ["0"] {
            print("User pressed 0 in a clear display.")
            return
        }
        
        else if waitingForNextNumberToStart == true {
            
            waitingForNextNumberToStart = false
            memoryFloatValue = Float(displayArray.joined())
            
            displayArray = []
            displayArray.append(number.rawValue)
            delegate?.updateResultLabel(display: displayArray)
            
        }
        
        else if calculatorIsClear {
            calculatorIsClear = false
            displayArray[0] = number.rawValue
            delegate?.updateResultLabel(display: displayArray)
        }
        
        else {
            displayArray.append(number.rawValue)
            delegate?.updateResultLabel(display: displayArray)
        }
        
    }
    
    
    func operationWasPressed(operation: CalculatorOperation) {
        
        if calculatorIsClear {
            print("User pressed operation before defining first number.")
            return
            
        }
        
        else {
            
            operationSelected = operation
            waitingForNextNumberToStart = true
            
            if memoryFloatValue != nil {
                
                waitingForNextNumberToStart = false
                controlWasPressed(control: .equal)
                
            }
            
        }
        
    }
    
    func controlWasPressed(control: CalculatorControl) {
        
        switch control {
            
        case .equal:
            
            if calculatorIsClear {
                return
            }
            
            else if waitingForNextNumberToStart == nil {
                print("User pressed equal before selecting an operation.")
                return
            }
            
            else if waitingForNextNumberToStart == true {
                print("User pressed in an operation and them pressed equal, before selecting any number.")
                return
            }
            
            
            displayFloatValue = Float(displayArray.joined())
            
            if let memoryFloatValue, let displayFloatValue, let operationSelected {
                
                switch operationSelected {
                
                case .add:
                    
                    displayArray = String(memoryFloatValue + displayFloatValue).map { String($0) }
                    checkForDotAndExtraZeros()
                    self.memoryFloatValue = nil
                    
                    delegate?.updateResultLabel(display: displayArray)
                    
                case .subtract:
                    
                    displayArray = String(memoryFloatValue - displayFloatValue).map { String($0) }
                    checkForDotAndExtraZeros()
                    self.memoryFloatValue = nil
                    
                    delegate?.updateResultLabel(display: displayArray)
                    
                case .multiply:
                    
                    displayArray = String(memoryFloatValue * displayFloatValue).map { String($0) }
                    checkForDotAndExtraZeros()
                    self.memoryFloatValue = nil
                    
                    delegate?.updateResultLabel(display: displayArray)
                    
                case .divide:
                    
                    if displayFloatValue == 0 {
                        divisionByZeroWasMade = true
                        displayArray = ("NaN").map { String($0) }
                    }
                    
                    else {
                        displayArray = String(memoryFloatValue / displayFloatValue).map { String($0) }
                        checkForDotAndExtraZeros()
                        self.memoryFloatValue = nil
                    }
                    
                    delegate?.updateResultLabel(display: displayArray)
                    
                }
            }
            

        case .ac:
            
            memoryFloatValue = nil
            displayArray = ["0"]
            displayFloatValue = 0
            
            calculatorIsClear = true
            isPositiveNumber = true
            
            dotIsOnDisplay = false
            divisionByZeroWasMade = false
            waitingForNextNumberToStart = nil
            
            operationSelected = nil
            
            delegate?.updateResultLabel(display: displayArray)
            
            

        case .percent:
            
            if divisionByZeroWasMade {
                print("NaN is on display.")
                return
            }
            
            else if displayArray == ["0"] {
                print("Percent was pressed, but zero is on display.")
                return
            }
            
            else {
                memoryFloatValue = Float(displayArray.joined())
                displayArray = ["1","0","0"]
                operationSelected = .divide
                waitingForNextNumberToStart = false
                controlWasPressed(control: .equal)
            }
            
        case .changeSign:
            
            if displayArray == ["0"] {
                print("Change signal was pressed, but zero is on display.")
                return
            }
            
            else if isPositiveNumber {
                displayArray.insert("-", at: 0)
                isPositiveNumber = false
                delegate?.updateResultLabel(display: displayArray)
            }
            
            else {
                displayArray.remove(at: 0)
                isPositiveNumber = true
                delegate?.updateResultLabel(display: displayArray)
            }
            
        }
        
    }
    
    
    func dotWasPressed() {
        
        if divisionByZeroWasMade {
            print("NaN is on display.")
            return
        }
        
        else if displayArray == ["0"] {
            print("Dot was pressed, but zero is on display.")
            return
        }
        
        else if !dotIsOnDisplay {
            displayArray.append(".")
            dotIsOnDisplay = true
            delegate?.updateResultLabel(display: displayArray)
        }
        
    }
    

}


// MARK: - Support Methods for CalculatorManager

extension CalculatorManager {
    
    func checkForDotAndExtraZeros() {
        
        dotIsOnDisplay = false
        let displayArraySize = displayArray.count
        
        for i in 0 ..< displayArraySize {
            
            if displayArray[i] == "." {
                dotIsOnDisplay = true
                
                if i == displayArraySize - 2 && displayArray.last == "0" {
                    displayArray.remove(at: i+1)
                    displayArray.remove(at: i)
                    return
                }
            }
        }
    }
    
    
}
