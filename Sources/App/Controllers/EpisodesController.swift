//
//  EpisodesController.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 2/10/23.
//

import Vapor
import Fluent

struct EpisodesController: RouteCollection {
    
    //MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware()){ builder in
            
            builder.get("episodes", use: allEpisodes)
            builder.get("episodes", ":id", use: getEpisodeByID)
        
        }
    }
    
    //MARK: - Routes
    func allEpisodes(request: Request) async throws -> [Episode.List] {
        
        
//        // Eager Loading with relations
//        try await Episode.query(on: request.db).with(\.$characters).all().map {
//            
//            Episode.Public(id: $0.id, 
//                           episodeNumber: $0.episodeNumber,
//                           title: $0.title, 
//                           airedAt: $0.airedAt,
//                           summary: $0.summary, 
//                           imageURL: $0.imageURL,
//                           characters: $0.characters)
//        }
        
        // All necessary data
        try await Episode.query(on: request.db).all().map {
            
            Episode.List(id: $0.id,
                         episodeNumber: $0.episodeNumber,
                         title: $0.title,
                         imageURL: $0.imageURL)
        }

    }
    
    func getEpisodeByID(req: Request) async throws -> Episode.Public {
        
        let id = req.parameters.get("id", as: UUID.self)
        
        guard let episode  = try await Episode.find(id, on: req.db) else {
            throw Abort(.notFound)
        }
        
        // Lazy Eager Loading¶
        try await episode.$characters.load(on: req.db)
        
        
        return Episode.Public(id: episode.id,
                              episodeNumber: episode.episodeNumber,
                              title: episode.title,
                              airedAt: episode.airedAt,
                              summary: episode.summary,
                              imageURL: episode.imageURL,
                              characters: episode.characters)
    }
    
}
