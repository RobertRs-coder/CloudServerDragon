import Vapor

struct APIKeyMiddleware: AsyncMiddleware {
    // MARK: - Override
    func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {

     // Get API Key
     guard let apiKey = request.headers.first(name: "CDS-ApiKey") else {
        throw Abort(.badRequest, reason: "CDS-ApiKey header is missing")
     }

     // Get API Key from Environment
    guard let envApiKey = Environment.process.API_KEY else { 
        throw Abort(.failedDependency)
    }
    // Compare both
    guard apiKey == envApiKey else {
        throw Abort(.unauthorized, reason: "Invalid API key")
    }

     return try await next.respond(to: request)   
    }
}