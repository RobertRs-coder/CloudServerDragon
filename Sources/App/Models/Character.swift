//
//  Character.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 2/10/23.
//

import Vapor
import Fluent

final class Character: Model, Content {
    // Schema - table news
    static var schema = "characters"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Siblings(through: EpisodeCharacter.self, from: \.$character, to: \.$episode)
    public var episodes: [Episode]
    
    // Init  - mandatory
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
