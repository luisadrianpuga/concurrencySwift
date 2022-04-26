//
//  UserAndPosts.swift
//  concurrency
//
//  Created by Luis Adrian on 4/26/22.
//

import Foundation


struct UserAndPosts: Identifiable {
    var id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
