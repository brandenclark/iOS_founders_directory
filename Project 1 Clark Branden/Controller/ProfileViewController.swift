//
//  ProfileViewController.swift
//  Project 1 Clark Branden
//
//  Created by Branden Clark on 9/25/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit
import MessageUI

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
        //Labels and ImageView
        @IBOutlet weak var phoneNumber: UILabel!
        @IBOutlet weak var emailAddress: UILabel!
        @IBOutlet weak var spouseName: UILabel!
        @IBOutlet weak var businessProfile: UILabel!
        @IBOutlet weak var profileImage: UIImageView!
        @IBOutlet weak var companyName: UILabel!
        @IBOutlet weak var FounderName: UILabel!
    
        //Buttons
        @IBOutlet weak var callButton: UIButton!
        @IBOutlet weak var emailButton: UIButton!
        @IBOutlet weak var textButton: UIButton!
        @IBOutlet weak var editProfileButton: UIBarButtonItem!
    

    // MARK: - Actions
        //Prepares a call to the current founder
        @IBAction func onCallButton(_ sender: Any) {
            UIApplication.shared.open(URL(string: "tel:\(founder?.phoneNumber ?? "4356326413")")!, options: [:], completionHandler: nil)
        }
    
        //Prepares email to the current founder
        @IBAction func onEmailButton(_ sender: Any) {
            UIApplication.shared.open(URL(string: "mailto:\(founder?.emailAddress ?? "")")! as URL, options: [:], completionHandler: nil)
        }
    
        //Prepares text to current founder
        @IBAction func onTextButton(_ sender: Any) {
                UIApplication.shared.open(URL(string: "sms:\(founder?.phoneNumber ?? "4356326413")")!, options: [:], completionHandler: nil)
        }
    
    // MARK: - Props
        //Give an outlet for our founder to be passed in to
        var founder : Contact?
    
    
        // MARK: - Lifecycle
        //Need to use WillAppear rather than WillLoad for coming back from EditView modal
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            
            //Test for if there is a founder, opening the app without a selected founder defaults to self
            if founder != nil{
                updateUI()
            }
            else{
                //Founder[1] is you!!
                founder = Directory.SharedInstance.founders[1]
                updateUI()
            }
        }
    
    // MARK: - Helpers
    
        //Grab picture from Assets folder
        private func displayImage(_ founder: Contact) {
            self.profileImage.image = UIImage(named: "\(founder.firstName.lowercased())_\(founder.lastName.lowercased())")
        }
    
        //Updates the view when needed
        private func updateUI() {
            
            //Hides edit button if it's not you're page
            if founder!.firstName != Directory.SharedInstance.founders[1].firstName{
                editProfileButton.title = ""
            }
            
            //Update all set data
            displayImage(founder!)
            spouseName.text = founder?.spouseName
            FounderName.text = "\(founder?.firstName.capitalized ?? " ") \(founder?.lastName.capitalized ?? " ")"
            companyName.text = founder?.companyName
            businessProfile.text = founder?.businessProfile
            
            //Manages showing/hiding phone number based on listing preference
            if founder?.listPhone ?? false {
                phoneNumber.text = "\(founder?.phoneNumber ?? " ")"
                callButton.isHidden = false
                textButton.isHidden = false
            }
            else{
                phoneNumber.text = "Unlisted"
                callButton.isHidden = true
                textButton.isHidden = true
            }
            
            //Manages showing/hiding email based on listing preference
            if (founder?.listEmail)!{
                emailAddress.text = founder?.emailAddress
                emailButton.isHidden = false
            }
            else{
                emailAddress.text = "Unlisted"
                emailButton.isHidden = true
            }
        }
}
