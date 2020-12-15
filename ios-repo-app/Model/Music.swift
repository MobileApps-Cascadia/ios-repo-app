//
//  Music.swift
//  ios-repo-app
//
//  Created by Clay Suttner on 12/15/20.
//  Copyright © 2020 Cascadia College. All rights reserved.
//

import Foundation

class Music: Codable, HasId {
    var id: Int?
    var music_url: String?
    var name: String?
    var description: String?
}
