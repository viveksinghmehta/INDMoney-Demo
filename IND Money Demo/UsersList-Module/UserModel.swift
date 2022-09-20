//
//  UserModel.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import Foundation


struct User: Codable {
    
    var id: String
    var name: String?
    var profileURL: String?
    var designation: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profileURL = "profile"
        case designation
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.profileURL = try container.decodeIfPresent(String.self, forKey: .profileURL)
        self.designation = try container.decodeIfPresent(String.self, forKey: .designation)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.profileURL, forKey: .profileURL)
        try container.encodeIfPresent(self.designation, forKey: .designation)
        try container.encodeIfPresent(self.description, forKey: .description)
    }
}
