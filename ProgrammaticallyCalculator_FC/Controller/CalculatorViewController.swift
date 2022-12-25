//
//  ViewController.swift
//  ProgrammaticallyCalculator_FC
//
//  Created by Filipe Rogério Canzi da Silva on 23/12/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MAIN STACK VIEW
    let mainStackView = CustomView.mainStackView()
    
    // MAIN VIEWS
    let resultView = CustomView.resultView()
    let percentLineStackView = CustomView.calculatorStackView()
    let sevenLineStackView = CustomView.calculatorStackView()
    let fourLineStackView = CustomView.calculatorStackView()
    let oneLineStackView = CustomView.calculatorStackView()
    let zeroLineStackView = CustomView.calculatorStackView()
    
    // RESULT LABEL
    let resultLabel = CustomView.resultLabel(withText: "0")
    
    // PERCENT LINE
    let percentButton = CustomView.calculatorButton(withSymbol: .percent)
    let allClearButton = CustomView.calculatorButton(withSymbol: .ac)
    let changeSignalButton = CustomView.calculatorButton(withSymbol: .changeSign)
    let divisionButton = CustomView.calculatorButton(withSymbol: .divide)
    
    // SEVEN LINE
    let sevenButton = CustomView.calculatorButton(withSymbol: .n7)
    let eightButton = CustomView.calculatorButton(withSymbol: .n8)
    let nineButton = CustomView.calculatorButton(withSymbol: .n9)
    let multiplicationButton = CustomView.calculatorButton(withSymbol: .multiply)
    
    // FOUR LINE
    let fourButton = CustomView.calculatorButton(withSymbol: .n4)
    let fiveButton = CustomView.calculatorButton(withSymbol: .n5)
    let sixButton = CustomView.calculatorButton(withSymbol: .n6)
    let subtractionButton = CustomView.calculatorButton(withSymbol: .subtract)
    
    // ONE LINE
    let oneButton = CustomView.calculatorButton(withSymbol: .n1)
    let twoButton = CustomView.calculatorButton(withSymbol: .n2)
    let threeButton = CustomView.calculatorButton(withSymbol: .n3)
    let additionButton = CustomView.calculatorButton(withSymbol: .add)
    
    // ZERO LINE
    let insideZeroLineStackView = CustomView.calculatorStackView()
    let zeroButton = CustomView.calculatorButton(withSymbol: .n0)
    let rightZeroLineStackView = CustomView.calculatorStackView()
    let dotButton = CustomView.calculatorButton(withSymbol: .dot)
    let equalButton = CustomView.calculatorButton(withSymbol: .equal)
    
    // CALCULATOR MANAGER
    var calculatorManager = CalculatorManager()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureCalculatorViewController()
        calculatorManager.delegate = self
        setDelegateOfAllCalculatorButtons()
        
    }


}


extension CalculatorViewController: CalculatorManagerDelegate {

    func updateResultLabel(display: [String]) {
        
        resultLabel.text = display.joined()
        
    }
    
    func setDelegateOfAllCalculatorButtons() {
        
        percentButton.delegate = calculatorManager
        allClearButton.delegate = calculatorManager
        changeSignalButton.delegate = calculatorManager
        divisionButton.delegate = calculatorManager
        
        sevenButton.delegate = calculatorManager
        eightButton.delegate = calculatorManager
        nineButton.delegate = calculatorManager
        multiplicationButton.delegate = calculatorManager
        
        fourButton.delegate = calculatorManager
        fiveButton.delegate = calculatorManager
        sixButton.delegate = calculatorManager
        subtractionButton.delegate = calculatorManager
        
        oneButton.delegate = calculatorManager
        twoButton.delegate = calculatorManager
        threeButton.delegate = calculatorManager
        additionButton.delegate = calculatorManager
        
        zeroButton.delegate = calculatorManager
        dotButton.delegate = calculatorManager
        equalButton.delegate = calculatorManager
        
    }
    
}
