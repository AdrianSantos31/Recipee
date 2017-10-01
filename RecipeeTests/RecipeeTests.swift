//
//  RecipeeTests.swift
//  RecipeeTests
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import XCTest
@testable import Recipee

class RecipeeTests: XCTestCase {

    //MARK: Recipe Class Tests
    
    //Confirm the Recipe initializer returns a Recipe object when passed valid parameters
    func testRecipeInitializationSucceeds(){
        let successTest = Recipe.init(photo: nil,name: "Test",length: "Less than 15 minutes",instructions: "This is a test instruction")
        XCTAssertNotNil(successTest)
    }
    
    //Confirm that the Recipe initializer returns a nil when pass en empty string
    func testRecipeInitializationFails(){
        let emptyStringRecipe = Recipe.init(photo: nil, name: "", length: "", instructions: "")
        XCTAssertNil(emptyStringRecipe)
    }
 
 
}
