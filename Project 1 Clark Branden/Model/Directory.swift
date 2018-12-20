//
//  Directory.swift
//  Project 1 Clark Branden
//
//  Created by Branden Clark on 9/25/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import Foundation

class Directory {
    
    //props
    let founders = [
    Contact(lastName: "Buffett",
            firstName: "Jimmy",
            companyName: "Berkshire Hatheway",
            phoneNumber: "234-567-8901",
            emailAddress: "jimmy@byu.edu",
            spouseName: "Marge",
            businessProfile: "BFFs with Bill Gates.",
            photoPath: "empty",
            listEmail: false),
    Contact(lastName: "Jenkins",
            firstName: "Jeff",
            companyName: "NeuroID",
            phoneNumber: "345-678-9012",
            emailAddress: "JeffJenkins@byu.edu",
            spouseName: "Justina",
            businessProfile: "Got locked in a stairwell trying to go see a Princess Leia statue at LucasFilm.",
            photoPath: "empty"),
    Contact(lastName: "Prescott",
            firstName: "Dak",
            companyName: "Dallas Cowboys",
            phoneNumber: "456-789-0123",
            emailAddress: "JeffJenkins@byu.edu",
            spouseName: "Danielle",
            businessProfile: "Dan Jones, BYU",
            photoPath: "empty",
            listPhone: false),
    Contact(lastName: "Presley",
            firstName: "Elvis",
            companyName: "Viva Las Vegas",
            phoneNumber: "567-890-1234",
            emailAddress: "the_real_elvis@byu.edu",
            spouseName: "Priscilla",
            businessProfile: "Hummina hay hay",
            photoPath: "empty",
            listPhone: false,
            listEmail: false),
    Contact(lastName: "Tebow",
            firstName: "Tim",
            companyName: "ESPN",
            phoneNumber: "678-901-2345",
            emailAddress: "timmyt@byu.edu",
            spouseName: "Football",
            businessProfile: "How much wood could a woodchuck chuck if a woodchuck could chuck wood?",
            photoPath: "empty"),
    Contact(lastName: "Timberlake",
            firstName: "Justin",
            companyName: "Timberline",
            phoneNumber: "123-456-7890",
            emailAddress: "jtbarrett@byu.edu",
            spouseName: "Jessica Biel",
            businessProfile: "Had an ancestor that guessed Justin's fate while immigrating across the Atlantic.",
            photoPath: "empty")]
    
    var currentDirectoryIndex = 0
    //constants
    
    //helpers
    
    //singleton pattern
    static let SharedInstance = Directory()

}
