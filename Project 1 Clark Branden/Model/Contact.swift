//
//  Contact.swift
//  Project 1 Clark Branden
//
//  Created by Branden Clark on 9/21/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import Foundation

class Contact {
    
    //properties
    var lastName: String
    var firstName: String
    var companyName: String
    var phoneNumber: String
    var listPhone: Bool
    var emailAddress: String
    var listEmail: Bool
    var spouseName: String
    var businessProfile: String
    var photoPath: String
    
    
    //helpers
    init(lastName: String, firstName: String, companyName: String, phoneNumber: String, emailAddress: String, spouseName: String, businessProfile: String, photoPath: String, listPhone: Bool = true, listEmail: Bool = true){
        self.lastName = lastName
        self.firstName = firstName
        self.companyName = companyName
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        self.spouseName = spouseName
        self.businessProfile = businessProfile
        self.photoPath = photoPath
        self.listEmail = listEmail 
        self.listPhone = listPhone
    }
}
