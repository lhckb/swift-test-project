//
//  ViewModel.swift
//  test-swift-app
//
//  Created by Luís Cruz on 28/03/23.
//

import Foundation
import SwiftUI

struct GithubUser: Codable, Hashable, Identifiable {
    let login: String
    let id: Int
    let url: String
    let avatar_url: String
}


class ViewModel: ObservableObject {
    @Published var users: [GithubUser] = []
    
    func fetch() {
        guard let ghUsers = URL(string: "https://api.github.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: ghUsers) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let users = try JSONDecoder().decode([GithubUser].self, from: data)
                DispatchQueue.main.async {
                    self?.users = users
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
