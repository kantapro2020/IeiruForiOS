//
//  User.swift
//  IeiruForiOS
//
//  Created by 蛭間寛大 on 2020/06/30.
//  Copyright © 2020 蛭間寛大. All rights reserved.
//

import Foundation

struct User : Codable {
    let id: Int
    let name: String
    let latitude: Float
    let longitude: Float
    let isHome: Bool
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case latitude
        case longitude
        case isHome = "is_home"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
