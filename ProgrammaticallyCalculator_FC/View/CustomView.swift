//
//  CustomView.swift
//  ProgrammaticallyCalculator_FC
//
//  Created by Filipe Rogério Canzi da Silva on 23/12/22.
//

import UIKit

struct CustomView {
 
    
    static func calculatorButton(withSymbol symbol: CalculatorSymbol) -> CalculatorButton {
        
        let button = CalculatorButton()
        button.configureButtonBySymbol(withSymbol: symbol)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        config.title = symbol.rawValue
        config.baseForegroundColor = .calculatorTextColor
        config.attributedTitle?.font = .monospacedDigitSystemFont(ofSize: 30, weight: .light)
        config.baseBackgroundColor = button.backgroundColor
        
        button.configuration = config
        
        return button
    }
    
    
    static func resultLabel(withText text: String) -> UILabel {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .calculatorTextColor
        label.font = .monospacedDigitSystemFont(ofSize: 50, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        
        return label
        
    }
    
    
    static func resultView() -> UIView {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .resultColor
        
        return view
        
    }
    
    
    static func mainStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        
        return stackView
    }
    
    
    static func calculatorStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        
        return stackView
    }
    
}
