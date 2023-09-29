import Vapor

struct AuthController: RouteCollection {
    // MARK: - Override
    func boot(routes: Vapor.RoutesBuilder) throws {

        routes.group("auth") { builder in

            builder.post("signup", use: signUp)
            
            builder.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
                
                builder.get("refresh", use: refresh)
            }
        }
    }
  
    // MARK: - Routes
    func signUp(req: Request) async throws -> JWTToken.Public {

        //Validate
        try User.Create.validate(content: req)
        
        // Decode user data
        var userCreate = try req.content.decode(User.Create.self)
        userCreate.password = try req.password.hash(userCreate.password)

        // Save user to db
        let user = User(name: userCreate.name, email: userCreate.email, password: userCreate.password)
        try await user.create(on: req.db)
        
        // JWT Tokens
        // Create tokens
        let tokens = JWTToken.generateTokens(userID: user.id!)
        // Sigend tokens
        let accessSigned = try req.jwt.sign(tokens.access)
        let refreshSigned = try req.jwt.sign(tokens.refresh)

        return JWTToken.Public(accesToken: accessSigned, refreshToken: refreshSigned)
    }
    
    func refresh(req: Request) async throws -> JWTToken.Public {
        
        //Get refresh token
        let token = try req.auth.require(JWTToken.self)
        
        // Verify type of JWT
        
        guard token.type == .refreshToken else {
            throw Abort(.methodNotAllowed)
        
        }
        
        // Get user id & search on db
        guard let user = try await User.find(UUID(token.sub.value), on: req.db) else {
            throw Abort(.unauthorized)
        }
        
        // JWT Tokens
        // Create tokens
        let tokens = JWTToken.generateTokens(userID: user.id!)
        // Sigend tokens
        let accessSigned = try req.jwt.sign(tokens.access)
        let refreshSigned = try req.jwt.sign(tokens.refresh)
        
        return JWTToken.Public(accesToken: accessSigned, refreshToken: refreshSigned)
    }
}
