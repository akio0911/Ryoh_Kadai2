//
//  ViewController.swift
//  Kadai2
//
//  Created by Ryoh on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var num1TextField: UITextField!
    @IBOutlet private weak var num2TextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var operatorSegmentedControl: UISegmentedControl!

    enum Operator: Int {
        case plus
        case minus
        case multiply
        case divide
        func calculate(_ number1: Double, _ number2: Double) -> String {
            switch self {
            case .plus:
                return "\(number1 + number2)"
            case .minus:
                return "\(number1 - number2)"
            case .multiply:
                return "\(number1 * number2)"
            case .divide:
                guard number2 != 0 else {
                    return "割る数には0以外を入力して下さい"
                }
                return "\(number1 / number2)"
            }
        }
    }

    @IBAction private func calculateButton(_ sender: Any) {
        let number1 = Double(num1TextField.text ?? "") ?? 0
        let number2 = Double(num2TextField.text ?? "") ?? 0

        guard let operatorIndex = Operator(rawValue: operatorSegmentedControl.selectedSegmentIndex) else {
            return
        }

        let resultNum = operatorIndex.calculate(number1, number2)
        resultLabel.text = resultNum
    }
}
