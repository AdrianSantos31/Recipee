//
//  Recipe.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit

class Recipe {
    //MARK: Properties
    var photo: UIImage?
    var name: String
    var length: String
    var instructions: String
    
    init?(photo: UIImage?, name: String, length: String, instructions: String){
        //Initialization should fail if there is no name, length nor instructions
        if name.isEmpty ||  length.isEmpty || instructions.isEmpty{
            return nil
        }
        
        //Initialize stored properties
        self.photo = photo
        self.name = name
        self.length = length
        self.instructions = instructions
        
    }
    
}
