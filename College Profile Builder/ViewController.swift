//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Brian W Thyfault on 2/8/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges:[CollegeDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        colleges.append(CollegeDetails.init(Name: "Univeristy of Southern California", Location: "Los Angeles, California", NumOfStudents: "44,000", Image: UIImage(named: "USC")!))
        colleges.append(CollegeDetails.init(Name: "Univeristy of California: Los Angeles", Location: "Los Angeles, California", NumOfStudents: "44,947", Image: UIImage(named: "UCLA")!))
        colleges.append(CollegeDetails.init(Name: "Univeristy of California: Santa Barbra", Location: "Santa Barbra, California", NumOfStudents: "23,497", Image: UIImage(named: "UCSB")!))
        colleges.append(CollegeDetails.init(Name: "Univeristy of California: Santa Cruz", Location: "Santa Cruz, California", NumOfStudents: "17,335", Image: UIImage(named: "UCSC")!))
        colleges.append(CollegeDetails.init(Name: "Chapman University", Location: "Orange, California", NumOfStudents: "8,305", Image: UIImage(named: "CU")!))
        colleges.append(CollegeDetails.init(Name: "Santa Clara University", Location: "Santa Clara, California", NumOfStudents: "9,015", Image: UIImage(named: "SCU")!))
        colleges.append(CollegeDetails.init(Name: "California State University: Fresno", Location: "Fresno, California", NumOfStudents: "24,136", Image: UIImage(named: "CSUF")!))
        //self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collegeCells", for: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete)
        {
            colleges.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.colleges[sourceIndexPath.row]
        colleges.remove(at: sourceIndexPath.row)
        colleges.insert(movedObject, at: destinationIndexPath.row)
        //self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! CollegeInfoView).collegeInfo = colleges[(tableView.indexPathForSelectedRow?.row)!]
    }

    @IBAction func startEditing(_ sender: Any) {
         tableView.isEditing = !tableView.isEditing
    }

    
    @IBAction func addCell(_ sender: Any) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .alert)
        alert.addTextField {
            (nameTextField) in nameTextField.placeholder = "School Name"
        }
        alert.addTextField {
            (locationTextField) in locationTextField.placeholder = "City, State"
        }
        alert.addTextField {
            (numTextField) in numTextField.placeholder = "# of Students"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "Add", style: .default) { (action) in
            self.colleges.append(CollegeDetails(Name:(alert.textFields?[0].text)!, Location: (alert.textFields?[1].text)!, NumOfStudents: (alert.textFields?[2].text)!, Image: UIImage(named: "default")!))
            self.tableView.reloadData()
        }
        alert.addAction(add)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func reload()
    {
        self.tableView.reloadData()
    }
    
    
}

