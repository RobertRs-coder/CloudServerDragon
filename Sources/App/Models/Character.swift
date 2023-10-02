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

    @Siblings(through: CharacterEpisode.self, from: \.$character, to: \.$episode)
    var episodes: [Episode]

    // Creates a new, empty User -> Always need it
    init() { }

    // Creates a new User with all properties set.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
