//
//  Character.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 2/10/23.
//

import Vapor
import Fluent

final class Character: Model {
    // Name of the table or collection.
    static let schema = "characters"
    
    // Propierties
    @ID(key: .id)
    var id: UUID?
    @Field(key: "name")
    var name: String
    @Field(key: "description")
    var description: String
    @Field(key: "favorite")
    var favorite: Bool
    @OptionalField(key: "imageURL")
    var imageURL: String?
    @Field(key: "type")
    var type: String

    
    @Siblings(through: EpisodeCharacter.self, from: \.$character, to: \.$episode)
    var episodes: [Episode]
    
    // Creates a new, empty Character -> Always need it
    init() { }
    
    // Creates a new User with all properties set.
    init(id: UUID? = nil, name: String, description: String, favorite: Bool, imageURL: String? = nil, type: String) {
        self.id = id
        self.name = name
        self.description = description
        self.favorite = favorite
        self.imageURL = imageURL
        self.type = type

    }
    
}
// MARK: - DTO's
extension Character {
    
    struct List: Content {
        let id: UUID?
        let name: String
        let imageURL: String?
    }
    
    struct Public: Content {
        let id: UUID?
        let name: String
        let description: String
        let favorite: Bool
        let imageURL: String?
    }
}

