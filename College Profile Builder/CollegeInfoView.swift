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

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        
        image.image = collegeInfo.image
        nameText.text = collegeInfo.name
        locationText.text = collegeInfo.location
        numOfStudentsText.text = collegeInfo.numOfStudents
    }

    func save()
    {
        collegeInfo.image = image.image!
        collegeInfo.name = nameText.text!
        collegeInfo.location = locationText.text!
        collegeInfo.numOfStudents = numOfStudentsText.text!
    
    }
    


}
