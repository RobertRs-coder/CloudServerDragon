//
//  Episode.swift
//  
//
//  Created by Roberto Rojo Sahuquillo on 2/10/23.
//

import Vapor
import Fluent

final class Episode: Model {
    // Name of the table or collection.
    static let schema = "episodes"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    @Timestamp(key: "created_at", on: .create, format: .iso8601)
    var createdAt: Date?
    @Field(key: "episode_number")
    var episodeNumber: Int
    @Field(key: "title")
    var title: String
    @Timestamp(key: "aired_at", on: .none, format: .iso8601)
    var airedAt: Date?
    @Field(key: "summary")
    var summary: String
    @OptionalField(key: "imageURL")
    var imageURL: String?
    @Siblings(through: EpisodeCharacter.self, from: \.$episode, to: \.$character)
    var characters: [Character]
    
    init() { }
    
    init(id: UUID? = nil, episodeNumber: Int, title: String, airedAt: Date? = nil, summary: String, imageURL: String? = nil) {
        self.id = id
        self.episodeNumber = episodeNumber
        self.title = title
        self.airedAt = airedAt
        self.summary = summary
        self.imageURL = imageURL
    }
}
// MARK: - DTO's
extension Episode {
    
    struct List: Content {
        let id: UUID?
        let episodeNumber: Int
        let title: String
        let imageURL: String?
    }
    
    struct Public: Content {
        let id: UUID?
        let episodeNumber: Int
        let title: String
        let airedAt: Date?
        let summary: String
        let imageURL: String?
        let characters:[Character]
    }
}
