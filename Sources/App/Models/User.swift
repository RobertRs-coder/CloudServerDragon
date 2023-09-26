import Vapor
import Fluent

final class User: Model {
    // Schema
    static var schema = "users"

    // Propierties
    @ID(key: .id)
    var id: UUID?
}