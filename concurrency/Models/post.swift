//
//  post.swift
//  concurrency
//
//  Created by Luis Adrian on 4/25/22.
//

import Foundation

//Source: https://jsonplaceholder.typicode.com/posts
// Single user post: https://jsonplaceholder.typicode.com/users/1/posts

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
