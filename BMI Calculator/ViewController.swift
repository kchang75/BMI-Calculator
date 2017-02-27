//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Kristi Chang on 2/13/17.
//  Copyright © 2017 kristi.chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: properties
    @IBOutlet weak var HeightTextField: UITextField!
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var UnitSwitchOutlet: UISwitch!
    @IBOutlet weak var ResultImageView: UIImageView!
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: actions
    @IBAction func UnitSwitch(_ sender: UISwitch) {
        if (UnitSwitchOutlet.isOn) {
            HeightTextField.text = ""
            WeightTextField.text = ""
            HeightTextField.placeholder = "in cm"
            WeightTextField.placeholder = "in kg"
        }
        else {
            HeightTextField.text = ""
            WeightTextField.text = ""
            HeightTextField.placeholder = "in inches"
            WeightTextField.placeholder = "in lbs"
        }
    }
    
    @IBAction func CalculateButton(_ sender: UIButton) {
        
        var weightBMI: Float
        var heightBMI: Float
        var rangeBMI: Float
        
        if (UnitSwitchOutlet.isOn) {
            heightBMI = Float(HeightTextField.text!)! / 100.00
            weightBMI = Float(WeightTextField.text!)!
        }
        else {
            heightBMI = Float(HeightTextField.text!)! * 0.0254
            weightBMI = Float(WeightTextField.text!)! * 0.4536
        }
        
        rangeBMI = (weightBMI / (heightBMI * heightBMI));
        
        if (rangeBMI < 16.00) {
            ResultLabel.text = "Severe Thinness";
            ResultImageView.image = UIImage (named:"thin3.png")
        } else if (rangeBMI < 17.00) {
            ResultLabel.text = "Moderate Thinness";
            ResultImageView.image = UIImage (named:"thin2.png")
        } else if (rangeBMI < 18.50) {
            ResultLabel.text = "Mild Thinness";
            ResultImageView.image = UIImage (named:"thin1.png")
        } else if (rangeBMI < 25.00) {
            ResultLabel.text = "Normal Range";
            ResultImageView.image = UIImage (named:"norm.png")
        } else if (rangeBMI < 30.00) {
            ResultLabel.text = "Overweight";
            ResultImageView.image = UIImage (named:"over.png")
        } else if (rangeBMI < 35.00) {
            ResultLabel.text = "Obese Class I (Moderate)";
            ResultImageView.image = UIImage (named:"obese1.png")
        } else if (rangeBMI < 40.00) {
            ResultLabel.text = "Obese Class II (Severe)";
            ResultImageView.image = UIImage (named:"obese2.png")
        } else {
            ResultLabel.text = "Obese Class III (Very Severe)";
            ResultImageView.image = UIImage (named:"obese3.png")
        }
    
        
    }
    
    
}

