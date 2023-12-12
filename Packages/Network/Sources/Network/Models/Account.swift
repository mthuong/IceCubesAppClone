//
//  File.swift
//  
//
//  Created by Thomas on 12/12/2023.
//

import Foundation

public struct Account: Codable, Identifiable {
    public let id: String
    public let username: String
    public let displayName: String
    public let avatar: URL
    
    public init(id: String, username: String, displayName: String, avatar: URL) {
        self.id = id
        self.username = username
        self.displayName = displayName
        self.avatar = avatar
    }
}
