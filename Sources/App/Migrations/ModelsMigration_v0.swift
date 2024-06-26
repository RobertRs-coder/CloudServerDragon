//
//  ModelsMigration_v0.swift
//  
//
//  Created by Roberto Rojo Sahuquillo on 3/2/23.
//

import Vapor
import Fluent

struct ModelsMigration_v0: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        
        try await database
            .schema(User.schema)
            .id()
            .field("created_at", .string)
            .field("name", .string, .required)
            .field("email", .string, .required)
            .field("password", .string, .required)
            //Constraint to email
            .unique(on: "email")
            .create()
        
//        try await database
//            .schema(News.schema)
//            .id()
//            .field("created_at", .string)
//            .field("title", .string, .required)
//            .field("body", .string, .required)
//            .field("imageURL", .string)
//            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        
        try await database.schema(User.schema).delete()
        
//        try await database.schema(News.schema).delete()
    }
     
}
