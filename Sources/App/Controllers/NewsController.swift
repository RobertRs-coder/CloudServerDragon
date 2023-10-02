//
//  NewsController.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 30/9/23.
//

import Vapor
import Fluent

struct NewsController: RouteCollection {
    
    // MARK: - Overrride
    func boot(routes: RoutesBuilder) throws {
        
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
            builder.get("news", use: allNews)
            builder.get("news", ":id", use: getNewsByID)

        }
    }
    
    //MARK: - Routes
    func allNews(req: Request) async throws -> [News] {
        let news = try await News.query(on: req.db).all()
        
        return news
    }
    
    func getNewsByID(req: Request) async throws -> News {
        let id = req.parameters.get("id", as: UUID.self)
        
        guard let news  = try await News.find(id, on: req.db) else {
            throw Abort(.notFound)
        }
        return news
    }
}
