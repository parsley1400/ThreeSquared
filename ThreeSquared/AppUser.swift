//
//  AppUser.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/10/17.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import Foundation
import Firebase

struct AppUser {
    let userID: String
    let userName: String

    init(data: [String: Any]) {
        userID = data["userID"] as! String
        userName = data["userName"] as! String
    }
}
