import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor
import JWT

// configures your application
public func configure(_ app: Application) async throws {

    guard let jwtKey = Environment.get("JWT_KEY") else { fatalError("JWT not found") }
    guard let _ = Environment.process.API_KEY else { fatalError("API_KEY not found") }
    guard let dbURL = Environment.process.DATABASE_URL else { fatalError("DATABASE_URL not found") }
    guard let _ = Environment.process.APP_BUNDLE_ID else { fatalError("APP_BUNDLE_ID not found") }

    // Configure JWT
    app.jwt.signers.use(.hs256(key: jwtKey))
    
    // Configure passwords hashes
    app.passwords.use(.bcrypt)

    // Activate Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // DB connection
    try app.databases.use(.postgres(url: dbURL), as: .psql)

    // Migrations
    app.migrations.add(ModelsMigration_v0())
    app.migrations.add(ModelsMigration_v1())
    app.migrations.add(ModelsMigration_v2())
    app.migrations.add(PopulateInitialData())
    try await app.autoMigrate()
    
    // register routes
    try routes(app)
}
