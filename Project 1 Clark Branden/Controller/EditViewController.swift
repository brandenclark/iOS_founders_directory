//
//  EditViewController.swift
//  Project 1 Clark Branden
//
//  Created by Branden Clark on 10/4/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets
    
    //TextFields and ImageView
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var spouseName: UITextField!
    @IBOutlet weak var businessProfile: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var founderName: UITextField!
    @IBOutlet weak var companyName: UITextField!
    
    //
    @IBOutlet weak var listPhoneSwitch: UISwitch!
    @IBOutlet weak var listEmailSwitch: UISwitch!
    
    // MARK: - Actions
    
    //Allow user to take or select new profile photo
    @IBAction func onEditPhoto(_ sender: Any) {
        //Set up image picker controller and delegate to this view
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        //Create action sheet to be used
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        //Add Camera option to action sheet
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            //Test if camera is available for use
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController,animated: true, completion: nil)
            }else{
                print("Camera not available")
            }
            
        }))
        
        //Add Photo Library option
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true, completion: nil)
        }))
        
        //Add cancel option
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //Display sheet
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    //Manage changing phone listing preferences
    @IBAction func onListPhoneSwitch(_ sender: Any) {
        founder.listPhone = listPhoneSwitch.isOn
        updateUI()
    }
    
    //Manage changing email listing preferences
    @IBAction func onListEmailSwitch(_ sender: Any) {
        founder.listEmail = listEmailSwitch.isOn
        updateUI()
    }
    
    
    // MARK: - Props
    
    //Set founder to be the user
    var founder = Directory.SharedInstance.founders[1]
    
    
    // MARK: - Helpers
    
    //Change the image to the founders
    private func displayImage(_ founder: Contact) {
        self.profileImage.image = UIImage(named: "\(founder.firstName.lowercased())_\(founder.lastName.lowercased())")
    }
    
    //Receive the new profile image picked
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        profileImage.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Handle the image picker being closed as cancelled and move back to view
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Updates the view when needed
    func updateUI() {
        
        //Set founder's static data
        spouseName.text = founder.spouseName
        founderName.text = "\(founder.firstName.capitalized) \(founder.lastName.capitalized)"
        companyName.text = founder.companyName
        businessProfile.text = founder.businessProfile
        phoneNumber.text = "\(founder.phoneNumber)"
        emailAddress.text = founder.emailAddress
        
        
        //Manages showing/hiding phone number based on listing preference
        if founder.listPhone {
            listPhoneSwitch.isOn = true
        }
        else{
            phoneNumber.text = "Unlisted"
            listPhoneSwitch.isOn = false
        }
        
        //Manages showing/hiding email based on listing preference
        if founder.listEmail{
            emailAddress.text = "\(founder.emailAddress)"
            listEmailSwitch.isOn = true
        }
        else{
            emailAddress.text = "Unlisted"
            listEmailSwitch.isOn = false
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage(founder)
        updateUI()
    }
}
