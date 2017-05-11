//
//  StudentTableViewController.swift
//  ManagementStudent
//
//  Created by Phi Trinh on 5/9/17.
//  Copyright © 2017 Phi Trinh. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {

    
    lazy var students: [Student] = {
        return Student.createStudent()
    }()
    
    
    var filteredStudent = [Student]()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        if Constants.isLoadDataAgain {
            let student: Student = Constants.student
            students.append(student)
            tableView.reloadData()
            Constants.isLoadDataAgain = false
        }
        super.viewWillAppear(true)
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudent.count
        }
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        
        let student: Student;
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudent[indexPath.row]
        } else {
            student = students[indexPath.row]
        }
        cell.configCellWith(student: student)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            
            let viewController = segue.destination as! StudentDetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let student: Student
                if searchController.isActive && searchController.searchBar.text != "" {
                    student = filteredStudent[indexPath.row]
                } else {
                    student = students[indexPath.row]
                }
                
                viewController.student = student
            }
            
        }
    }

    func filterContentForSearchText(_ searchText: String) {
        filteredStudent = students.filter({(student : Student) -> Bool in
            return student.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
 
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentStudent = students[sourceIndexPath.row];
        students.remove(at: sourceIndexPath.row)
        students.insert(currentStudent, at: destinationIndexPath.row)
    }
}

extension StudentTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension StudentTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
