//
//  AddRecipeViewController.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit

class AddRecipeViewController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    // MARK: Properties
    
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var recipePhoto: UIImageView!
    @IBOutlet weak var recipeInstructionsField: UITextView!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    var cookTime: String = "Less than 15 minutes"{
        didSet{
            detailLabel.text = cookTime
        }
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeNameTextField.delegate = self
        self.recipeInstructionsField.delegate = self as? UITextViewDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide the keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickCookingTime",
            let recipePickerViewController = segue.destination as? AddRecipeViewController{
            recipePickerViewController.cookTime = cookTime
        }
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the Keyboard
        recipeNameTextField.resignFirstResponder()
        recipeInstructionsField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        recipeNameTextField.text = recipeNameTextField.text
        recipeInstructionsField.text = recipeInstructionsField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            recipePhoto.image = image
        }else{
            //Error message
        }
        
        //Dismiss the picker
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK: Actions
    
    @IBAction func uploadPhoto(_ sender: AnyObject) {
    
        //UIImagePickerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.allowsEditing = false
        
        //Make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true){
            
            
        }
        
        
    }


    
}

extension AddRecipeViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            recipeNameTextField.becomeFirstResponder()
        }
    }
    
}


extension AddRecipeViewController{
    @IBAction func unwindwithSelectedCookingTime(_ segue: UIStoryboardSegue){
        if let cookingTimePickerViewController = segue.source as? CookingTimePickerViewController,
            let selectedCookingTime = cookingTimePickerViewController.selectedCookingTime{
            cookTime = selectedCookingTime
        }
    }
}
