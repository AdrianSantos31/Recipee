//
//  SecondViewController.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseAuth

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var signButton: UIButton!
    
//    @IBAction func signInMock(_ sender: UIButton) {
//        if emailField.text! == "drchuan" && passwordField.text! == "coolestProf"{
//            
//            print("Success")
//        }else{
//            print("Error")
//        }
//    }
    
    
    /*
 @IBAction func action(_ sender: UIButton)
    {
        if emailField.text != "" && passwordField.text != ""{
            if segmentControl.selectedSegmentIndex == 0
            {
            //Log in user
                Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                    if user != nil
                    {
                        print("Success")
                    }
                    else
                    {
                        if let myError = error?.localizedDescription{
                            print(myError)
                        }else{
                            print("Error")
                        }
                    }
                }
            }
            else
            {//Sign up user
                Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                    if user != nil
                    {
                        
                    }
                    else
                    {
                        if let myError = error?.localizedDescription{
                            print(myError)
                        }else{
                            print("Error")
                        }
                    }
                }
                
            }
        
        }
        
    }*/

    
    
    
    
    //MARK: Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field's user input through delegate callbacks
        self.emailField.delegate = self
        self.passwordField.delegate = self
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    //Hide the keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable the Save button while editing
        //saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the Keyboard
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
    

    //MARK: Actions
    /*@IBAction func SignIn(_ sender: Any){
        if let email = emailField.text, let password = passwordField.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
        
                if error == nil{
                    //perform segue
                    self.performSegue(withIdentifier: "SignIn", sender: nil)
                }else{
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if error != nil{
                            print("Can't sign in user")
                        }else{
                            //perform segue
                            self.performSegue(withIdentifier: "SignIn", sender: nil)
                        }
                    }
                }
            }
        }
    }*/
}

