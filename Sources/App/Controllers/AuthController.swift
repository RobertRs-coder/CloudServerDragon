import Vapor

struct AuthController: RouteCollection {
    // MARK: - Override
    func boot(routes: Vapor.RoutesBuilder) throws {

        routes.group("auth") { builder in

            builder.post("signup", use: signUp)
        }
    }
  
    // MARK: - Routes
    func signUp(req: Request) async throws -> User.Public {

        let userCreate = try req.content.decode(User.Create.self)

        // Save user to db
        let user = User(name: userCreate.name, email: userCreate.email, password: userCreate.password)
        try await user.create(on: req.db)

        // Tranform
        let userPublic = User.Public(id: user.id?.uuidString ?? "", name: user.name, email: user.email)

        return userPublic
    } 
}