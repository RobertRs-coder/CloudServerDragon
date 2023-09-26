import Vapor
import Fluent

final class User: Model, Content{
    // Schema - table name
    static var schema = "users"

    // Properties
    @ID(key: .id)
    var id: UUID?

    @Timestamp(key: "created_at", on: .create, format: .iso8601)
    var createdAt: Date?

    @Field(key: "name")
    var name: String

    @Field(key: "email")
    var email: String

    @Field(key: "password")
    var password: String

    // Init  - mandatory
    init() { }

    init(id: UUID? = nil, name: String, email: String, password: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }

}
// MARK: - User DTO's
extension User {

    struct Create: Content {
        let name: String
        let email: String
        let password: String
    }

    struct SignIn: Content {
        let email: String
        let password: String
    }

    struct Public: Content {
        let id: String
        let name: String
        let email: String
    }
}