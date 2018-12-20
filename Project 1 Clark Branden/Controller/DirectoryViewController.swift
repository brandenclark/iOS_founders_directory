//
//  DirectoryViewController.swift
//  Project 1 Clark Branden
//
//  Created by Branden Clark on 9/25/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit

class DirectoryViewController: UITableViewController {
    // MARK: - Constants
    private struct Storyboard {
        static let ContactDetailCellIdentifier = "ContactDetailCell"
        static let ShowProfileSegueIdentifier = "ShowProfile"
    }
    
    // MARK: - Data Source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ContactDetailCellIdentifier, for: indexPath)
        let founder = Directory.SharedInstance.founders[indexPath.row]
        
        //Name labels for directory "Lastname, Firstname"
        cell.textLabel?.text = "\(founder.lastName), \(founder.firstName)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Directory.SharedInstance.founders.count
    }
    
    // MARK: - Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowProfileSegueIdentifier, sender: indexPath)
    }
    
    // MARK: - Segues
    
    //Send the selected founder along to the ProfileViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController {
            if let detailVC = navVC.viewControllers.first as? ProfileViewController {
                if let indexPath = sender as? IndexPath {
                    detailVC.founder = Directory.SharedInstance.founders[indexPath.row]
                }
            }
        }
    }
}
