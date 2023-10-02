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
            .schema(Character.schema)
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("favorite", .bool)
            .field("imageURL", .string)
            .field("type", .string)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        
        try await database.schema(Character.schema).delete()


    }
}
