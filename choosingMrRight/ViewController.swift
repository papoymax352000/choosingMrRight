//
//  ViewController.swift
//  choosingMrRight
//
//  Created by Chi-Che Hsieh on 2018/5/31.
//  Copyright © 2018年 ppquitmax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var StarTextField: UITextField!
    @IBOutlet weak var GenderSegControl: UISegmentedControl!
    @IBOutlet weak var AgeSlider: UISlider!
    @IBOutlet weak var BadHabitSwitch: UISwitch!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var CheckAnswer: UIButton!
    @IBOutlet weak var ResetAll: UIButton!
    
    @IBAction func AgeCheck(_ sender: UISlider) {
        AgeLabel.text = String(Int(AgeSlider.value*50))
    }
    @IBAction func CheckMrRight(_ sender: UIButton) {
        if ((StarTextField.text?.isEmpty)!) || (GenderSegControl.selectedSegmentIndex == -1) {
            myImage.image = #imageLiteral(resourceName: "error")
            CheckAnswer.isEnabled = false
        } else if ((Int(AgeSlider.value*50)>=20)&&(Int(AgeSlider.value*50)<=40)) && ((StarTextField.text=="巨蟹座")||(StarTextField.text=="雙魚座")||(StarTextField.text=="摩羯座")||(StarTextField.text=="牡羊座")) && (BadHabitSwitch.isOn == false) {
            // myImage.image = #imageLiteral(resourceName: "womanIsYou")
            switch GenderSegControl.selectedSegmentIndex {
            case 0:                 // tester is male
                myImage.image = #imageLiteral(resourceName: "womanIsYou")
            case 1:                 // tester is female
                myImage.image = #imageLiteral(resourceName: "manIsYou")
            default:
                break
            }
        } else {
            switch GenderSegControl.selectedSegmentIndex {
            case 0:                 // tester is male
                myImage.image = #imageLiteral(resourceName: "womanIsntYou")
            case 1:                 // tester is female
                myImage.image = #imageLiteral(resourceName: "manIsntYou")
            default:
                break
            }
        }
        CheckAnswer.isEnabled = false
    }
    @IBAction func ResetButton(_ sender: UIButton) {
        myImage.image = #imageLiteral(resourceName: "areWeMatch")
        StarTextField.text = nil
        GenderSegControl.selectedSegmentIndex = -1
        AgeSlider.value = 0.5
        AgeLabel.text = String(Int(AgeSlider.value*50))
        BadHabitSwitch.setOn(false, animated: true)
        CheckAnswer.isEnabled = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 幫button加上圓角
        CheckAnswer.layer.cornerRadius = 5
        ResetAll.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

