//
//  ViewController.swift
//  Caclulator
//
//  Created by Shikhar Sharma on 24/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var workingLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var working : String = ""
    
    func addToWorking (value : String) {
        working = working + value
        workingLabel.text = working
    }
    
    func clearAll () {
        working = ""
        workingLabel.text = ""
        resultLabel.text = ""
    }
    
    @IBAction func clearAllBtn(_ sender: Any) {
        clearAll()
    }
    @IBAction func clearBtn(_ sender: Any) {
        if (!working.isEmpty) {
            working.removeLast()
            workingLabel.text = working
        }
    }
    @IBAction func moduloBtn(_ sender: Any) {
        addToWorking(value: "%")
    }
    @IBAction func divideBtn(_ sender: Any) {
        addToWorking(value: "/")
    }
    @IBAction func productBtn(_ sender: Any) {
        addToWorking(value: "*")
    }
    @IBAction func subtractBtn(_ sender: Any) {
        addToWorking(value: "-")
    }
    @IBAction func addBtn(_ sender: Any) {
        addToWorking(value: "+")
    }
    @IBAction func equalBtn(_ sender: Any) {
        if (validInput()) {
            let checkedWorkingsForPercent = working.replacingOccurrences(of: "%", with: "*0.1")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultLabel.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Math not possible for this expression", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func validInput () -> Bool {
        // two special characters should not be next to each other
        var prevSpecial : Bool = false
        for ch in working {
            if (prevSpecial && isSpecialChar(char: ch)) {
                return false;
            }
            prevSpecial = isSpecialChar(char: ch)
        }
        // addition and subtraction can be present as first character
        // rest cannot be present at first character
        
        let firstChar = working[working.startIndex]
        let lastChar = working[working.index(working.endIndex, offsetBy: -1)]
        
        if (isSpecialChar(char: firstChar) && firstChar != "+" && firstChar != "-") {
            return false;
        }
        if (isSpecialChar(char: firstChar) || isSpecialChar(char: lastChar)) {
            return false;
        }
        
        return true
    }
    
    func isSpecialChar (char :Character ) -> Bool {
        if (char == "+" || char == "*" || char == "-" || char == "/") {
            return true
        } else {
            return false
        }
    }
    
    func formatResult (result : Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func sevenBtn(_ sender: Any) {
        addToWorking(value: "7")
    }
    @IBAction func eightBtn(_ sender: Any) {
        addToWorking(value: "8")
    }
    @IBAction func nineBtn(_ sender: Any) {
        addToWorking(value: "9")
    }
    @IBAction func fourBtn(_ sender: Any) {
        addToWorking(value: "4")
    }
    @IBAction func fiveBtn(_ sender: Any) {
        addToWorking(value: "5")
    }
    @IBAction func sixBtn(_ sender: Any) {
        addToWorking(value: "6")
    }
    @IBAction func oneBtn(_ sender: Any) {
        addToWorking(value: "1")
    }
    @IBAction func twoBtn(_ sender: Any) {
        addToWorking(value: "2")
    }
    @IBAction func threeBtn(_ sender: Any) {
        addToWorking(value: "3")
    }
    @IBAction func decimalBtn(_ sender: Any) {
        addToWorking(value: ".")
    }
    @IBAction func zeroBtn(_ sender: Any) {
        addToWorking(value: "0")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
}
