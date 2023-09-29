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

    struct Create: Content, Validatable {
        
        let name: String
        let email: String
        var password: String
        
        
        static func validations(_ validations: inout Vapor.Validations) {
            validations.add("name", as: String.self, is: !.empty, required: true)
            validations.add("email", as: String.self, is: !.empty, required: true)
            validations.add("password", as: String.self, is: .count(6...), required: true)
        }
    }

    struct SignIn: Content {
        let email: String
        let password: String

        
        static func validations(_ validations: inout Vapor.Validations) {
            validations.add("email", as: String.self, is: !.empty, required: true)
            // For scurity not count anything
            validations.add("password", as: String.self, is: !.empty, required: true)
        }
    }

    struct Public: Content {
        let id: String
        let name: String
        let email: String
    }
}
