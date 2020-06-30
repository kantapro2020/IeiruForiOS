//
//  Response.swift
//  IeiruForiOS
//
//  Created by 蛭間寛大 on 2020/06/30.
//  Copyright © 2020 蛭間寛大. All rights reserved.
//

import Foundation
struct Response : Codable {
    let status: String
    let data: [User]
}
