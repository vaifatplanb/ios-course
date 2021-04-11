//
//  TodoItem.swift
//  sample_project
//
//  Created by Vaifat Huy on 4/11/21.
//

import UIKit

class TodoItem: Decodable{
    let userId: Int
    let userName: String? // user_name
    let id: Int
    let title: String
    let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userId, id, title, completed
        case userName = "user_name"
    }
    
    init(userId: Int, userName: String, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.userName = userName
        self.id = id
        self.title = title
        self.completed = completed
    }
}
