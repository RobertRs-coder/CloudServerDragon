//
//  EpisodesController.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 2/10/23.
//

import Vapor
import Fluent

struct EpisodesController: RouteCollection {
    
    // MARK: - Overrride
    func boot(routes: RoutesBuilder) throws {
        
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
            builder.get("episodes", use: allEpisodes)
        }
    }
    
    //MARK: - Routes
    func allEpisodes(req: Request) async throws -> [Episode] {
        
        let episodes = try await Episode.query(on: req.db).all()
        
        
        return episodes
    }
}
