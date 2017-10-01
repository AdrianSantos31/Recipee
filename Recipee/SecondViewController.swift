//
//  SecondViewController.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var recipeNameLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field's user input through delegate callbacks
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the Keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        recipeNameLabel.text = recipeNameTextField.text
    }
    
    
    //MARK: Actions

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        recipeNameLabel.text = "Default Text"
    }
}

