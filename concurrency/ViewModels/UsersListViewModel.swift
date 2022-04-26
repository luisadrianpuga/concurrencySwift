//
//  UsersListViewModel.swift
//  concurrency
//
//  Created by Luis Adrian on 4/25/22.
//

import Foundation

class UsersListViewModel: ObservableObject {
    
    @Published var usersAndPosts: [UserAndPosts] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    @MainActor
    func fetchUsers() async {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        let apiService2 = APIService(urlString: "https://jsonplaceholder.typicode.com/posts")
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            
            async let users: [User] = try await apiService.getJSON()
            async let posts: [Post] = try await apiService2.getJSON()
            let (fetchUsers, fetchPosts) = await (try users, try posts)
            for user in fetchUsers {
                let userPosts = fetchPosts.filter {$0.userId == user.id}
                let newUserAndPosts = UserAndPosts(user: user, posts: userPosts)
                usersAndPosts.append(newUserAndPosts)
            }
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
        }
    }
}


extension UsersListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.usersAndPosts = UserAndPosts.mockUsersAndPosts
        }
    }
}

