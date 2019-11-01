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
    
    
    
    
    var converters: [Converter] = []
    var convIndex = 0
    var maxIndex = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let converter1 = Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C")
        let converter2 = Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F")
        let converter3 = Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km")
        let converter4 = Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")
        converters.append(converter1)
        converters.append(converter2)
        converters.append(converter3)
        converters.append(converter4)
        
        self.outputDisplay.text = converters[convIndex].outputUnit
        self.inputDisplay.text = converters[convIndex].inputUnit
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func converter(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        for i in 0 ... maxIndex {
            alert.addAction(UIAlertAction(title: converters[i].label, style: UIAlertAction.Style.default, handler: {(alertAction)-> Void in
                self.convIndex = i
                self.inputDisplay.text = self.converters[self.convIndex].inputUnit
                self.outputDisplay.text = self.converters[self.convIndex].outputUnit
                
            }))
        }
        
        self.present(alert, animated: true) {
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
