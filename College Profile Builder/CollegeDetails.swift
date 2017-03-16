//
//  CollegeDetails.swift
//  College Profile Builder
//
//  Created by Brian W Thyfault on 2/8/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import MapKit

class CollegeDetails: NSObject {

    var name = ""
    var location = ""
    var numOfStudents = ""
    var websiteAddress = ""
    var image:UIImage = UIImage(named: "default")!
    var selectedPin: MKPlacemark
    
    init(Name: String, Location: String, NumOfStudents: String, WebsiteAddress: String, Image:UIImage, SelectedPin: MKPlacemark) {
        name = Name
        location = Location
        numOfStudents = NumOfStudents
        websiteAddress = WebsiteAddress
        image = Image
        selectedPin = SelectedPin
    }
    
}
