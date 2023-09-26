import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {

    guard let jwtKey = Environment.get("JWT_KEY") else { fatalError("JWT not found") }
    guard let _ = Environment.process.API_KEY else { fatalError("API_KEY not found") }
    guard let dbURL = Environment.process.DATABASE_URL else { fatalError("DATABASE_URL not found") }
    guard let _ = Environment.process.APP_BUNDLE_ID else { fatalError("APP_BUNDLE_ID not found") }

    // Activate Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // DB connection
    try app.databases.use(.postgres(url: dbURL), as: .psql)

    
    // register routes
    try routes(app)
}
