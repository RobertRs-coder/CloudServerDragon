import Foundation
import Fluent

struct ModelsMigration_v0: AsyncMigration {
    func prepare(on database: FluentKit.Database) async throws {
        //Create tables
        try await database
            .schema(User.schema)
            .id()
            .field("created_at", .string)
            .field("name", .string, .required)
            .field("email", .string, .required)
            .field("password", .string, .required)
            .unique(on: "email")
            .create()
        
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
            .field("episode_number", .string, .required)
            .field("title", .string, .required)
            .field("aired_at", .string)
            .field("summary", .string, .required)
            .field("imageURL", .string)
            .create()
    }
    
    func revert(on database: Database) async throws {
        //Delete if problems
        try await database.schema(User.schema).delete()
        try await database.schema(News.schema).delete()
        try await database.schema(Character.schema).delete()
        try await database.schema(Episode.schema).delete()



    }
}
