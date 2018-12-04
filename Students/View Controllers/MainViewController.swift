//
//  MainViewController.swift
//  Students
//
//  Created by Benjamin Hakes on 12/3/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    private let networkClient = NetworkClient()
    private var studentsTableViewController: StudentsTableViewController!
    
    private var students: [Student] = []{
        didSet {
            updateSort()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchStudents { (students, error) -> Void in
            if let error = error {
                NSLog("Error getting students: \(error)")
                return
            }
            print ("test")
            self.students = students ?? []
        }
    }
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    @IBAction func sort(_ sender: Any) {
        updateSort()
    }
    
    
    private func updateSort(){
        DispatchQueue.main.async {
            let sortedStudents: [Student]
            if self.sortSelector.selectedSegmentIndex == 0 {
                // Sort by first name
                sortedStudents = self.students.sorted{ $0.firstName < $1.firstName}
            } else {
                sortedStudents = self.students.sorted {($0.lastName ?? "") < ($1.lastName ?? "")
                }
                
            }
            self.studentsTableViewController.students = sortedStudents
        }
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "embedStudentsTableView"{
            let studentsTableVC = segue.destination as! StudentsTableViewController
            studentsTableViewController = studentsTableVC
        }
    }
    

    
    
}
