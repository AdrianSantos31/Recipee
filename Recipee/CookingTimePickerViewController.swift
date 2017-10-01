//
//  CookingTimePickerViewController.swift
//  Recipee
//
//  Created by Adrian Santos on 10/1/17.
//  Copyright © 2017 Adrian Santos. All rights reserved.
//

import UIKit

class CookingTimePickerViewController: UITableViewController{
    
    var cookingTime = ["Less than 15 minutes", "15 - 30 minutes", "30 - 45 minutes", "More than 45 minutes"]
    
    //selectedCookingApps
    var selectedCookingTime: String?{
        didSet{
            if let selectedCookingTime = selectedCookingTime,
                let index = cookingTime.index(of: selectedCookingTime){
                selectedCookingTimeIndex = index
            }
        }
    }
    
    var selectedCookingTimeIndex: Int?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        guard segue.identifier == "SaveSelectedCookingTime",
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else{
                return
        }
        
        let index = indexPath.row
        selectedCookingTime = cookingTime[index]
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
}

extension CookingTimePickerViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cookingTime.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CookingTimeCell", for: indexPath)
        cell.textLabel?.text = cookingTime[indexPath.row]
        
        if indexPath.row == selectedCookingTimeIndex{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
}

extension CookingTimePickerViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let index = selectedCookingTimeIndex{
            let cell = tableView.cellForRow(at: IndexPath(row:index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedCookingTime = cookingTime[indexPath.row]
        
        //update the checkmark for the current row
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
    }
}
