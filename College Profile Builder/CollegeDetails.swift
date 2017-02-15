//
//  CollegeDetails.swift
//  College Profile Builder
//
//  Created by Brian W Thyfault on 2/8/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit

class CollegeDetails: NSObject {

    var name = ""
    var location = ""
    var numOfStudents = ""
    var image:UIImage = UIImage(named: "default")!
    
    init(Name: String, Location: String, NumOfStudents: String, Image:UIImage) {
        name = Name
        location = Location
        numOfStudents = NumOfStudents
        image = Image
    }
    
}
