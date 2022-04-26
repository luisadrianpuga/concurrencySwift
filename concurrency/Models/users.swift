//
//  users.swift
//  concurrency
//
//  Created by Luis Adrian on 4/25/22.
//

import Foundation


//Source: https://jsonplaceholder.typicode.com/users

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    
}
