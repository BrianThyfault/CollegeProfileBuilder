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


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! CollegeInfoView).collegeInfo = colleges[(tableView.indexPathForSelectedRow?.row)!]
    }

    
    
    
}

