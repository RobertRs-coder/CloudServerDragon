//
//  Episode+Character.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 2/10/23.
//

import Vapor
import Fluent

final class CharacterEpisode: Model {
    // Name of the table or collection.
    static let schema = "character+episode"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "character_id")
    var character: Character
    
    @Parent(key: "episode_id")
    var episode: Episode
    
    init() { }
    
//    //Vapor Documentation
//    init(id: UUID? = nil, characterID: Character.IDValue, episodeID: Episode.IDValue) {
//        self.id = id
//        self.$character.id = characterID
//        self.$episode.id = episodeID
//    }
    
    //Class
    init(id: UUID? = nil, character: Character, episode: Episode) throws {
        self.id = id
        self.$character.id = try character.requireID()
        self.$episode.id =  try episode.requireID()
    }
}
