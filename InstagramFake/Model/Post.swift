//
//  Post.swift
//  InstagramFake
//
//  Created by Marlon Machado on 18/05/21.
//

import Foundation


// MARK: - Post
struct Post: Codable, Identifiable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
