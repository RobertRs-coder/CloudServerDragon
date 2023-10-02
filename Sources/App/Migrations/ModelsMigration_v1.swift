//
//  ModelsMigration_v1.swift
//  
//
//  Created by Roberto Rojo Sahuquillo on 9/2/23.
//

import Vapor
import Fluent

struct ModelsMigration_v1: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        
        try await database
            .schema(News.schema)
            .id()
            .field("created_at", .string)
            .field("title", .string, .required)
            .field("body", .string, .required)
            .field("imageURL", .string)
            .create()
        
        try await database
            .schema(Character.schema)
            .id()
            .field("name", .string, .required)
            .create()
        
        try await database
            .schema(Episode.schema)
            .id()
            .field("created_at", .string)
            .field("episode_number", .int, .required)
            .field("title", .string, .required)
            .field("aired_at", .string)
            .field("summary", .string, .required)
            .field("imageURL", .string)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        
        try await database.schema(News.schema).delete()
        try await database.schema(Character.schema).delete()
        try await database.schema(Episode.schema).delete()


    }
}
