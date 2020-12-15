//
//  User.swift
//  ios-api-app
//
//  Created by Brian Bansenauer on 10/5/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//
class Music: Codable, hasID{
    var id: Int?
    var name: String?
    var music_url: String?
    var description: String?
}
