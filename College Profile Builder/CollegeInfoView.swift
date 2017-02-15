//
//  CollegeInfoView.swift
//  College Profile Builder
//
//  Created by Brian W Thyfault on 2/8/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit

class CollegeInfoView: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var numOfStudentsText: UITextField!
    
    var collegeInfo: CollegeDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = CollegeDetails.image
        nameText.text = CollegeDetails.name
        locationText.text = CollegeDetails.location
        numOfStudentsText.text = CollegeDetails.numOfStudents
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
