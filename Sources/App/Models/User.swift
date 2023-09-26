import Vapor
import Fluent

final class User: Model {
    // Schema - table name
    static var schema = "users"

    // Properties
    @ID(key: .id)
    var id: UUID?

    @Timestamp(key: "created_at", on: .create, format: .default)
    var created_at: Date?

}