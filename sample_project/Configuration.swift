//
//  Configuration.swift
//  sample_project
//
//  Created by Vaifat Huy on 4/17/21.
//

import Foundation

class Configuration {
    static let environment: Environment = {
        if let env = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            return Environment(rawValue: env) ?? .production
        }
        return .production
    }()
}

enum Environment: String {
    case debug = "Debug"
    case production = "Release"
    
    var baseURL: String {
        switch self {
        case .debug:
            return "192.168.1.1/root"
        case .production:
            return "www.google.com"
        }
    }
}
