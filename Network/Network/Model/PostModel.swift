//
//  PostModel.swift
//  Network
//
//  Created by Gabriel Santiago on 18/08/22.
//

import Foundation

struct PostModel : Decodable, Hashable {
    
    let id: String
    let content: String
    let media : String?
    let like_count: Int?
    let user_id: String
    let created_at: String
    let updated_at: String?
}
