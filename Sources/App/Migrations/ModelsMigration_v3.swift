//
//  File.swift
//  
//
//  Created by Roberto Rojo Sahuquillo on 19/10/23.
//

import Vapor
import Fluent

struct ModelsMigration_v3: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        
        try await database
            .schema(EpisodeCharacter.schema)
            .id()
            .field("episode_id", .uuid, .required, .references(Episode.schema, "id"))
            .field("character_id", .uuid, .required, .references(Character.schema, "id"))
            .create()
        
    }
    
    func revert(on database: FluentKit.Database) async throws {
        
        try await database.schema(EpisodeCharacter.schema).delete()
        
    }
}
