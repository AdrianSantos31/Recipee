//
//  RecipeTableViewController.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit
import os.log

class RecipeTableViewController: UITableViewController{

    //MARK: Properties
    
    var recipes = [Recipe]()
    /*
    @IBOutlet weak var recipeSearch: UISearchBar!
    var filteredData = [String]()
    var isSearching = false
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedRecipes = loadRecipes(){
            recipes += savedRecipes
        }else{
            loadSampleRecipes()
        }
        
        //recipeSearch.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        /*
        if isSearching{
            return filteredData.count
        }*/
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "allRecipes"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RecipeTableViewCell else{
            fatalError("The dequeued cell is not an instance of RecipeTableView Cell")
        }
        
        //Fetches the appropriate recipe for the data source layout
        let recipe = recipes[indexPath.row]
        
       /* let text: String!
        
        if isSearching{
            text = filteredData[indexPath.row]
        }else{
             text = recipe.name
        }*/
        
        // Configure the cell...
        cell.recipePicture.image = recipe.photo
        cell.recipeNameLabel.text = recipe.name
        cell.cookingTimeLabel.text = recipe.length

        return cell
    }
 


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            recipes.remove(at: indexPath.row)
            saveRecipes()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? ""){
        
            case "AddItem":
            os_log("Adding a new recipe", log: OSLog.default, type: .debug)
            
            case "ShowDetail":
                guard let recipeDetailViewController = segue.destination as? AddRecipeViewController else{
                    fatalError("Unexpected desination: \(segue.destination)")
                    }
                guard let selectedRecipeCell = sender as? RecipeTableViewCell else{
                        fatalError("Unexpected sender: \(sender)")//Expected Error
                    }
                    
                guard let indexPath = tableView.indexPath(for: selectedRecipeCell) else{
                        fatalError("The selected cell is not being dispayed by the table")
                    }
                    
                let selectedRecipe = recipes[indexPath.row]
                    recipeDetailViewController.recipe = selectedRecipe
            
            
            default:
                fatalError("Unexpected Segue Identifier; \(segue.identifier))")//Expected Error
        }
    }
    
    //MARK: -Actions
    
    @IBAction func unwindToRecipeList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddRecipeViewController, let recipe = sourceViewController.recipe{
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                
                //Update an existing recipe
                recipes[selectedIndexPath.row] = recipe
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                
            }else{
                //Add a new recipe
                let newIndexPath = IndexPath(row: recipes.count, section: 0)
                
                recipes.append(recipe)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                
            }
            //Save the recipes
            saveRecipes()
        }
    }
    
    //MARK: - Private Actions
    private func loadSampleRecipes(){
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let recipe1 = Recipe(photo: photo1, name:"Caprese Salad",length: "15 - 30 minutes", instructions: "This is a test instruction")else{
            fatalError("Unable to instantiate meal1")
        }
        
        guard let recipe2 = Recipe(photo: photo2, name:"Chicken with Potatoes", length: "30 - 45 minutes", instructions: "This is a test instruction")else{
            fatalError("Unable to instantiate meal1")
        }
        
        guard let recipe3 = Recipe(photo: photo3, name:"Pasta with Meatballs", length: "30 - 45 minutes", instructions: "This is a test instruction")else{
            fatalError("Unable to instantiate meal1")
        }
        
        recipes += [recipe1, recipe2, recipe3]
    }
    

    
    private func saveRecipes(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(recipes, toFile: Recipe.ArchiveURL.path)
        if isSuccessfulSave{
            os_log("Meals successfuly saved..", log: OSLog.default, type: .debug)
        }else{
            os_log("Failed to save meals..", log: OSLog.default, type: .error)
        }
    }
    
    private func loadRecipes() -> [Recipe]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Recipe.ArchiveURL.path) as? [Recipe]
    }
    
    //MARK: Custom Actions
        /*func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        //Fetches the appropriate recipe for the data source layout
        var recipe: Recipe?
        var test
        
        if let recipe = recipe{test = recipe.name}
        
        if recipeSearch.text == nil || recipeSearch.text == ""{
            isSearching = false
            
            view.endEditing(true)
            
            tableView.reloadData()
        }else{
            isSearching = true
            filteredData = recipe.name.filter({$0 == recipeSearch.text})
            tableView.reloadData()
        }
    }
     */
    
}
/*
extension RecipeTableViewController{
    
    @IBAction func cancelToSecondViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveRecipeDetail(_ segue: UIStoryboardSegue) {
    }

}
 */
