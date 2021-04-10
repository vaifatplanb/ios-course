//
//  Enum.swift
//  sample_project
//
//  Created by Vaifat Huy on 4/10/21.
//

import Foundation

enum UserDefaultKeys {
    case age
    case name
    
    var value: String {
        switch self {
        case .age:
            return "Age"
        case .name:
            return "Name"
        }
    }
}

enum KeychainKeys {
    case age
    case name
    
    var value: String {
        switch self {
        case .age:
            return "Age"
        case .name:
            return "Name"
        }
    }
}
