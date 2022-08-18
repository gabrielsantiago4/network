//
//  UserController.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import Foundation
struct UserController {
    static func log(_ name: String, _ email: String, _ password: String) async {
        await ApiService.newUser(name: name, email: email, password: password)
    }
}
