//
//  Episode+Character.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 2/10/23.
//

import Vapor
import Fluent

final class EpisodeCharacter: Model {

    // Schema - table news
    static var schema = "episode+character"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "episode_id")
    var episode: Episode
    
    @Parent(key: "character_id")
    var character: Character

    // Init  - mandatory
    init() { }
    
    init(id: UUID? = nil, episode: Episode, character: Character) throws{
        self.id = id
        self.$episode.id = try episode.requireID()
        self.$character.id = try character.requireID()
    }
}
