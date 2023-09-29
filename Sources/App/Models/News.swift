//
//  News.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 29/9/23.
//

import Vapor
import Fluent

final class News: Model, Content {
    // Schema - table news
    static var schema = "news"

    // Properties
    @ID(key: .id)
    var id: UUID?

    @Timestamp(key: "created_at", on: .create, format: .iso8601)
    var createdAt: Date?

    @Field(key: "title")
    var title: String

    @Field(key: "body")
    var body: String

    @Field(key: "image")
    var imageURL: String?

    // Init  - mandatory
    init() { }

    init(id: UUID? = nil, title: String, body: String, iamageURL: String? = nil) {
        self.id = id
        self.title = title
        self.body = body
        self.imageURL = imageURL
    }

}
// MARK: - User DTO's
extension News {
    //
}
