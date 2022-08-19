//
//  TokenHandlerModel.swift
//  Network
//
//  Created by Matheus Augusto Alves de Meneses on 18/08/22.
//

import Foundation
struct TokenHandlerModel : Decodable {
    let token: String
    let user: UserModel
}
