//
//  File.swift
//  
//
//  Created by Thomas on 12/12/2023.
//

import Foundation

public struct Status: Codable, Identifiable {
    public let id: String
    public let content: String
    public let account: Account
    
    public init(id: String, content: String, account: Account) {
        self.id = id
        self.content = content
        self.account = account
    }
}
