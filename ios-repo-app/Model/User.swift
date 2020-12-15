//
//  User.swift
//  ios-api-app
//
//  Created by Brian Bansenauer on 10/5/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//
class User: Codable, HasId {
    var id: Int?
    var FirstName: String?
    var LastName: String?
    var PhoneNumber: String?
    var SID: String?
}

