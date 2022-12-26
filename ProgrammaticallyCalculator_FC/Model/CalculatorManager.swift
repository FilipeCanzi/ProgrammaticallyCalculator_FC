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
    
    var divisionByZeroWasMade: Bool = false
    var waitingForNextNumberToStart: Bool? = nil
    
    var operationSelected: CalculatorOperation? = nil
    
    
    func resetManagerProprieties() {
        
        memoryFloatValue = nil
        displayArray = ["0"]
        displayFloatValue = 0

        divisionByZeroWasMade = false
        waitingForNextNumberToStart = nil
        
        operationSelected = nil
        
        delegate?.updateResultLabel(display: displayArray)
        
    }
    
    
}


// MARK: - CalculatorButtonDelegate Methods
extension CalculatorManager: CalculatorButtonDelegate {
    
    
    func numberWasPressed(number: CalculatorNumber) {
        
        if divisionByZeroWasMade {
            print("NaN is on display.")
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
        
        else if displayArray == ["0"] {
            displayArray[0] = number.rawValue
            delegate?.updateResultLabel(display: displayArray)
        }
        
        else {
            displayArray.append(number.rawValue)
            delegate?.updateResultLabel(display: displayArray)
        }
        
    }
    
    
    func operationWasPressed(operation: CalculatorOperation) {
        
        if displayArray == ["0"] && memoryFloatValue == nil {
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
            equalWasPressed()
            

        case .ac:
            resetManagerProprieties()

            
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
            
            if divisionByZeroWasMade {
                print("NaN is on display.")
                return
            }
            
            if displayArray == ["0"] {
                print("Change signal was pressed, but zero is on display.")
                return
            }
            
            else if displayArray[0] == "-" {
                displayArray.remove(at: 0)
                delegate?.updateResultLabel(display: displayArray)
            }
            
            else {
                displayArray.insert("-", at: 0)
                delegate?.updateResultLabel(display: displayArray)
            }
            
        }
        
    }
    
    
    func dotWasPressed() {
        
        if divisionByZeroWasMade {
            print("NaN is on display.")
            return
        }
                
        else {
            for char in displayArray {
                if char == "." {
                    print("Dot was pressed, but there is already a dot on display.")
                    return
                }
            }
            
            displayArray.append(".")
            delegate?.updateResultLabel(display: displayArray)
        }
        
    }
    

}


// MARK: - Support Methods for CalculatorManager

extension CalculatorManager {
    
    func checkForExtraZeros() {
    
        let arraySize = displayArray.count
        
        if displayArray[arraySize - 2] == "." {
            if displayArray[arraySize - 1] == "0" {
                displayArray.remove(at: arraySize - 1)
                displayArray.remove(at: arraySize - 2)
            }
        }
    }
    
    
}


// MARK: - equalWasPressed Method

extension CalculatorManager {
    
    func equalWasPressed() {
        
        if divisionByZeroWasMade {
            print("NaN is on display.")
            return
        }
        
        if displayArray == ["0"] && memoryFloatValue == nil {
            print("User pressed equal before defining first number.")
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
                checkForExtraZeros()
                self.memoryFloatValue = nil
                self.operationSelected = nil
                
                delegate?.updateResultLabel(display: displayArray)
                
            case .subtract:
                
                displayArray = String(memoryFloatValue - displayFloatValue).map { String($0) }
                checkForExtraZeros()
                self.memoryFloatValue = nil
                self.operationSelected = nil
                
                delegate?.updateResultLabel(display: displayArray)
                
            case .multiply:
                
                displayArray = String(memoryFloatValue * displayFloatValue).map { String($0) }
                checkForExtraZeros()
                self.memoryFloatValue = nil
                self.operationSelected = nil
                
                delegate?.updateResultLabel(display: displayArray)
                
            case .divide:
                
                if displayFloatValue == 0 {
                    divisionByZeroWasMade = true
                    displayArray = ("NaN").map { String($0) }
                }
                
                else {
                    displayArray = String(memoryFloatValue / displayFloatValue).map { String($0) }
                    checkForExtraZeros()
                    self.memoryFloatValue = nil
                    self.operationSelected = nil
                }
                
                delegate?.updateResultLabel(display: displayArray)
                
            }
        }
        
    }
    
}
