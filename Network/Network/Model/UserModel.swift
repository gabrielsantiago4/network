//
//  UserModel.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import Foundation

struct UserModel: Decodable, Hashable {
    
    let id: String
    let name: String
    let email: String
    let avatar: String?
    
}
