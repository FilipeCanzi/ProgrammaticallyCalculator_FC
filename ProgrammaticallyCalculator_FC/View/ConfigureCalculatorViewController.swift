//
//  ConfigureCalculatorViewController.swift
//  ProgrammaticallyCalculator_FC
//
//  Created by Filipe Rogério Canzi da Silva on 23/12/22.
//

import UIKit


extension CalculatorViewController {
    
    func configureCalculatorViewController() {
        
        view.backgroundColor = .black
        
        view.addSubview(mainStackView)
        

        // RESULT
        mainStackView.addArrangedSubview(resultView)
        resultView.addSubview(resultLabel)
        
        // PERCENT LINE
        mainStackView.addArrangedSubview(percentLineStackView)
        percentLineStackView.addArrangedSubview(percentButton)
        percentLineStackView.addArrangedSubview(allClearButton)
        percentLineStackView.addArrangedSubview(changeSignalButton)
        percentLineStackView.addArrangedSubview(divisionButton)
        
        // SEVEN LINE
        mainStackView.addArrangedSubview(sevenLineStackView)
        sevenLineStackView.addArrangedSubview(sevenButton)
        sevenLineStackView.addArrangedSubview(eightButton)
        sevenLineStackView.addArrangedSubview(nineButton)
        sevenLineStackView.addArrangedSubview(multiplicationButton)
        
        // FOUR LINE
        mainStackView.addArrangedSubview(fourLineStackView)
        fourLineStackView.addArrangedSubview(fourButton)
        fourLineStackView.addArrangedSubview(fiveButton)
        fourLineStackView.addArrangedSubview(sixButton)
        fourLineStackView.addArrangedSubview(subtractionButton)
        

        // ONE LINE
        mainStackView.addArrangedSubview(oneLineStackView)
        oneLineStackView.addArrangedSubview(oneButton)
        oneLineStackView.addArrangedSubview(twoButton)
        oneLineStackView.addArrangedSubview(threeButton)
        oneLineStackView.addArrangedSubview(additionButton)
        
        // ZERO LINE
        mainStackView.addArrangedSubview(zeroLineStackView)
        zeroLineStackView.addArrangedSubview(insideZeroLineStackView)
        insideZeroLineStackView.addArrangedSubview(zeroButton)
        insideZeroLineStackView.addArrangedSubview(rightZeroLineStackView)
        rightZeroLineStackView.addArrangedSubview(dotButton)
        rightZeroLineStackView.addArrangedSubview(equalButton)
        

     
        NSLayoutConstraint.activate([

            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            resultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -10),
            resultLabel.centerYAnchor.constraint(equalTo: resultView.centerYAnchor)
            
        ])
      
        
        
    }
    
    
}
