//
//  StudentsTableViewController.swift
//  Students
//
//  Created by Benjamin Hakes on 12/3/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = students[indexPath.row].name

        return cell
    }
    
    // MARK: - Properties
    
    var students: [Student] = []{
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

}
