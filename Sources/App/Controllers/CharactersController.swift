//
//  CharactersController.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 19/10/23.
//


import Vapor
import Fluent

struct CharactersController: RouteCollection {
    
    // MARK: - Overrride
    func boot(routes: RoutesBuilder) throws {
        
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
            builder.get("characters", use: allCharacters)
            builder.get("characters", ":id", use: getCharacterByID)
            
        }
    }
    
    //MARK: - Routes
    func allCharacters(request: Request) async throws -> [Character.List] {
        // All necessary data
        try await Character.query(on: request.db).all().map {
            
            Character.List(id: $0.id,
                           name: $0.name,
                           imageURL: $0.imageURL)
        }
    }
    
    func getCharacterByID(request: Request) async throws -> Character.Public {
        let id = request.parameters.get("id", as: UUID.self)
        
        guard let character  = try await Character.find(id, on: request.db) else {
            throw Abort(.notFound)
        }
        
//                // Lazy Eager Loading¶
//                try await character.$episodes.load(on: request.db)
        
        
        return Character.Public(id: character.id,
                                name: character.name,
                                description: character.description,
                                favorite: character.favorite,
                                imageURL: character.imageURL)
    }
}
