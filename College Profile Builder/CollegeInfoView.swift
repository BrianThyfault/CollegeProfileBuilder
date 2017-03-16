//
//  CollegeInfoView.swift
//  College Profile Builder
//
//  Created by Brian W Thyfault on 2/8/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import SafariServices
import MapKit

class CollegeInfoView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var numOfStudentsText: UITextField!
    @IBOutlet weak var editPicture: UIButton!
    @IBOutlet weak var websiteText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var numOfStudentsLabel: UILabel!
    @IBOutlet weak var websiteButton: UIButton!
    
    var collegeInfo: CollegeDetails!
    var link = URL(string: "")
    
    let imagePicker = UIImagePickerController()
    let navigation = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = self.editButtonItem
        
        imagePicker.delegate = self
        navigation.delegate = self
        
        image.image = collegeInfo.image
        nameText.text = collegeInfo.name
        locationText.text = collegeInfo.location
        numOfStudentsText.text = collegeInfo.numOfStudents
        nameLabel.text = collegeInfo.name
        locationLabel.text = collegeInfo.location
        numOfStudentsLabel.text = collegeInfo.numOfStudents
        websiteText.text = collegeInfo.websiteAddress
        link = URL(string: collegeInfo.websiteAddress)
    }

    override func setEditing(_ editing: Bool, animated: Bool) {

        
        if(editing)
        {
            if(nameText.isHidden == false)
            {
                editButtonItem.title = "Edit"
                save()
                update()
                startEditing()
            }
            else
            {
                editButtonItem.title = "Save"
                startEditing()
            }
        }
        
    }
    
    
    func save()
    {
        collegeInfo.image = image.image!
        collegeInfo.name = nameText.text!
        collegeInfo.location = locationText.text!
        collegeInfo.numOfStudents = numOfStudentsText.text!
        collegeInfo.websiteAddress = websiteText.text!
        link = URL(string: collegeInfo.websiteAddress)
    
    }
    
    func update()
    {
        image.image = collegeInfo.image
        nameText.text = collegeInfo.name
        locationText.text = collegeInfo.location
        numOfStudentsText.text = collegeInfo.numOfStudents
        nameLabel.text = collegeInfo.name
        locationLabel.text = collegeInfo.location
        numOfStudentsLabel.text = collegeInfo.numOfStudents
    }
    
    func startEditing()
    {
    
        nameText.isHidden = !nameText.isHidden
        locationText.isHidden = !locationText.isHidden
        numOfStudentsText.isHidden = !numOfStudentsText.isHidden
        websiteText.isHidden = !websiteText.isHidden
        websiteButton.isHidden = !websiteButton.isHidden
        nameLabel.isHidden = !nameText.isHidden
        locationLabel.isHidden = !nameText.isHidden
        numOfStudentsLabel.isHidden = !nameText.isHidden
        editPicture.isHidden = !editPicture.isHidden
        
    }
    
    @IBAction func editPicture(_ sender: Any) {
        getPhotoLibrary()
    }
    
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.image.image = selectedImage
        }
    }
    
    @IBAction func goToWebsite(_ sender: Any) {
        if(collegeInfo.websiteAddress == "")
        {
            let alert = UIAlertController(title: "Missing Website Address", message: "Add desired website address in 'Edit' mode", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        else
        {
            let SVC = SFSafariViewController(url: link!)
            present(SVC, animated: true, completion: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! MapViewController).selectedPin = collegeInfo.selectedPin
    }
    

}
