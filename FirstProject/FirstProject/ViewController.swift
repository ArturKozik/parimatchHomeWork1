//
//  ViewController.swift
//  FirstProject
//
//  Created by Artur Kozik on 10.12.2020.
//  Copyright © 2020 Artur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var methodSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private enum ControlType: Int {
        case factorialRecursion = 0, factorialIteration, fibonacci, digitOfPi
    }
    
    private var selectedControlType: ControlType = .factorialRecursion
    private var n: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateResultBySelectedMethod()
    }
    
    @IBAction func methodDidChange(_ sender: UISegmentedControl) {
        selectedControlType = ControlType(rawValue: sender.selectedSegmentIndex) ?? .factorialRecursion
        updateResultBySelectedMethod()
    }
    
    @IBAction func numberDidChange(_ sender: UITextField) {
        n = Int(sender.text ?? "")
        updateResultBySelectedMethod()
    }
    
    private func updateResultBySelectedMethod() {
        var text = ""
        
        guard let n = n else { resultLabel.text = text; return }
        
        switch selectedControlType {
        case .factorialRecursion:
            text = "\(factorialRecursion(of: n) ?? 0)"
        case .factorialIteration:
            text = "\(factorialIteration(of: n) ?? 0)"
        case .fibonacci:
            text = "\(findFibonacchi(of: n))"
        case .digitOfPi:
            text = findDigitOfPiFraction(digit: n)
        }
        
        resultLabel.text = text
    }
    
    func factorialRecursion(of number: Int) -> Int? {
        if number < 0 {
            print("You can not get factorical of negative number")
            return nil
        } else if number == 0 {
            return 1
        } else {
            if let factorial = factorialRecursion(of: number - 1) {
                return number * factorial
            }
            
            return nil
        }
    }

    func factorialIteration(of number: Int) -> Int? {
        var res = 1
        
        if number < 0 {
            print("You can not get factorical of negative number")
            return nil
        } else if number == 0 {
            return res
        }
        
        for n in 1...number {
            res *= n
        }
        
        return res
    }

    func findFibonacchi(of num: Int) -> [Int] {
        var res: [Int] = []
        
        guard num > 1 else {
            print("Number should be greater than 1.")
            return res
        }
        
        res.append(0)
        
        for n in 1...num - 1 {
            res.append(fib(n))
        }
        
        return res
    }

    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        return fib(n - 1) + fib(n - 2)
    }
    
    func findDigitOfPiFraction(digit: Int) -> String {
        let string = String(Double.pi).components(separatedBy: ".").last ?? ""
        let index = digit - 1
        return string[index] + " of \(Double.pi)"
    }

}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
