//
//  Recipe.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit
import os.log

class Recipe: NSObject, NSCoding {
    //MARK: Properties
    var photo: UIImage?
    var name: String
    var length: String
    var instructions: String
    
    //MARK: Archiving Paths
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("recipes")
    
    //MARK: Types
    struct PropertyKey{
        static let photo = "photo"
        static let name = "name"
        static let length = "length"
        static let instructions = "instructions"
    }
    
    
    init?(photo: UIImage?, name: String, length: String, instructions: String){
        //Initialization should fail if there is no name, length nor instructions
        /*
        if name.isEmpty ||  length.isEmpty || instructions.isEmpty{
            return nil
        }
        */
        
        guard !name.isEmpty else{
            return nil
        }
        
        guard !length.isEmpty else{
            return nil
        }
        
        guard !instructions.isEmpty else{
            return nil
        }
        
        //Initialize stored properties
        self.photo = photo
        self.name = name
        self.length = length
        self.instructions = instructions
        
    }
    

    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(length, forKey: PropertyKey.length)
        aCoder.encode(instructions, forKey: PropertyKey.instructions)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
            else{
                os_log("Unable to decode the name for a Meal object", log: OSLog.default, type: .debug)
                return nil
        }
        
        //Since photo is optional, we can use a conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let length = aDecoder.decodeObject(forKey: PropertyKey.length) as? String
        let instructions = aDecoder.decodeObject(forKey: PropertyKey.instructions) as? String
        
        //Must call designated initializer
        self.init(photo:photo, name:name, length:length!, instructions:instructions!)
    }
    
}
