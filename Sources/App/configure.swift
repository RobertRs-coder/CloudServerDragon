import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {

    guard let jwtKey = Environment.get("JWT_KEY") else { fatalError("JWT not found") }
    guard let _ = Environment.process.API_KEY else { fatalError() }
    guard let dbURL = Environment.process.DATABASE_URL else { fatalError() }
    guard let _ = Environment.process.APP_BUNDLE_ID else { fatalError() }

    // Activate Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
}
