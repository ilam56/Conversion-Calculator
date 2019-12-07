//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Ian Anderson on 11/1/19.
//  Copyright © 2019 Ian Anderson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    

  
    @IBOutlet weak var outputDisplay: UITextField!
    
    
 
    @IBOutlet weak var inputDisplay: UITextField!
    
 
    
    
    
    var value: Double = 0.0
    var converters: [Converter] = []
    var convIndex = 0
    var maxIndex = 3
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let converter1 = Converter(label: "fahrenheit to celcius", inputUnit: " °F", outputUnit: " °C")
        let converter2 = Converter(label: "celcius to fahrenheit", inputUnit: " °C", outputUnit: " °F")
        let converter3 = Converter(label: "miles to kilometers", inputUnit: " mi", outputUnit: " km")
        let converter4 = Converter(label: "kilometers to miles", inputUnit: " km", outputUnit: " mi")
        converters.append(converter1)
        converters.append(converter2)
        converters.append(converter3)
        converters.append(converter4)
        
        outputDisplay.text = converters[convIndex].outputUnit
        inputDisplay.text = converters[convIndex].inputUnit
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clear(_ sender: Any) {
        value = 0
        text = ""
        outputDisplay.text = converters[convIndex].outputUnit
        inputDisplay.text = converters[convIndex].inputUnit
    }
    @IBAction func plusMinus(_ sender: Any) {
        value = 0 - value
        if(value < 0){
            text = "-" + text
        }
        else {
            text.remove(at: text.startIndex)
        }
        addToValue("")
    }
    
    @IBAction func decimal(_ sender: Any) {
        addToValue(".")
    }
    @IBAction func converter(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        for i in 0 ... maxIndex {
            alert.addAction(UIAlertAction(title: converters[i].label, style: UIAlertAction.Style.default, handler: {(alertAction)-> Void in
                self.convIndex = i
                self.inputDisplay.text = self.converters[self.convIndex].inputUnit
                self.outputDisplay.text = self.converters[self.convIndex].outputUnit
                let outText = String(format: "%.2f", self.calcOutput(self.value))
                if(self.text != ""){
                self.outputDisplay.text = outText + self.converters[self.convIndex].outputUnit
                }
                self.inputDisplay.text = self.text + self.converters[self.convIndex].inputUnit
                
            }))
        }
        
        self.present(alert, animated: true) {
        }
    }
    
    
    @IBAction func zero(_ sender: Any) {
        addToValue("0")
    }
    @IBAction func one(_ sender: Any) {
        addToValue("1")
    }
    @IBAction func two(_ sender: Any) {
        addToValue("2")
    }
    @IBAction func three(_ sender: Any) {
        addToValue("3")
    }
    @IBAction func four(_ sender: Any) {
        addToValue("4")
    }
    @IBAction func five(_ sender: Any) {
        addToValue("5")
    }
    @IBAction func six(_ sender: Any) {
        addToValue("6")
    }
    @IBAction func seven(_ sender: Any) {
        addToValue("7")
    }
    @IBAction func eight(_ sender: Any) {
        addToValue("8")
    }
    @IBAction func nine(_ sender: Any) {
        addToValue("9")
    }
    
    func addToValue(_ number: String){
        text.append(number)
        inputDisplay.text = text + converters[convIndex].inputUnit
        if let stringValue = Double(text) {
            value = stringValue
            let outText = String(format: "%.2f", calcOutput(value))
            outputDisplay.text = outText + converters[convIndex].outputUnit
        }
 
    }
    
    func calcOutput(_ number: Double) -> Double{
        switch convIndex {
        case 0:
            return (number-32) * (5/9)
        case 1:
            return (number * (9/5)) + 32
        case 2:
            return (number * 1.60934)
        case 3:
            return (number / 1.60934)
        default:
            return 0
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
